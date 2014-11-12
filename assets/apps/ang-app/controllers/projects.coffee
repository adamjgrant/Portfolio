define ['./module'], (controllers) ->
	controllers.controller 'ProjectsCtrl', ['$scope', 'ngProgress', '$location', '$anchorScroll', ($scope, ngProgress, $location, $anchorScroll) ->
		$scope.alternateArticles = (id) ->
			# Looks for duplicates of a project and returns array for "also see" links.
			thisProj = $scope.projects.filter (el) ->
				el.id == id
			thisProj = thisProj[0]
			dupes = $scope.projects.filter (el) ->
				el.name == thisProj.name && el.id != thisProj.id
			dupes
		$scope.getNameForCategorySlug = (slug) ->
			category = $scope.categories.filter (el) ->
				el.slug == slug
			category[0].name

		$scope.categories = [
			id: 0
			name: 'Delights'
			slug: 'delights'
			lead: 'Here are some of my just-for-fun projects.'
			desc: 'Every once in a while, I like to work on small, quick projects for my own amusement.'
		,
			id: 1
			name: 'Mobile Experiences'
			slug: 'mobile'
			lead: 'I try to do projects mobile-friendly and mobile-first.'
			desc: 'Lately I\'ve found it more challenging to anticipate the user experience of a mobile device and not just making the parts fit on the screen.'
		,
			id: 2
			name: 'Full Stack Development'
			slug: 'development'
			lead: 'I\'ve built several websites from top to bottom.'
			desc: 'While I prefer to work as close to the design side of projects as possible, when the job needs to be done, I\'m happy to pick up on the latest and greatest back- and front-end frameworks. Most of my earlier projects were written in PHP while more recently I\'ve worked in .NET, Django, and Ruby on Rails.'
		,
			id: 3
			name: 'Design'
			slug: 'design'
			lead: 'My motivation to get into UX started with an experience most of us have...'
			desc: '...the experience of poor UX. I would collect and blog about simple UI mistakes with horrible consequences and gradually came to realize I could develop great UX for a living.'
		]
		$scope.$on '$locationChangeSuccess', ->
			setTimeout ->
				$('.affixer').affix
					offset:
						top: 285
			, 500
			true
		$scope.setLocation = (path, id, immediate) ->
			waitTime = 0
			$location.path(path)
			if !immediate
				$('html, body').animate
	        		scrollTop: $('body').offset().top
	        	, 0
	        	waitTime = 500
			setTimeout ->
				$scope.scrollToId id, 150, 200
			, waitTime
		$scope.scrollToId = (id, offset, duration) ->
			offset = (offset || 0)
			duration = (duration || 0)
			$('html, body').animate
				scrollTop: $('#' + id).offset().top - offset
			, duration
			true
		$scope.selectedCategory = () ->
			if $location.path() == '/'
				a =
					slug: 'home'
					name: 'Home'
				a
			else
				catSlug = $location.path().substr 1, $location.path().length
				catIndex = 0
				$.grep($scope.categories, (e, i) -> catIndex = i if e.slug == catSlug )
				$scope.categories[catIndex]
		$scope.slug = (string) ->
			slug = (str) ->
				str = str.replace(/^\s+|\s+$/g, "") # trim
				str = str.toLowerCase()

				# remove accents, swap ñ for n, etc
				from = "ãàáäâẽèéëêìíïîõòóöôùúüûñç·/_,:;"
				to = "aaaaaeeeeeiiiiooooouuuunc------"
				i = 0
				l = from.length

				while i < l
					str = str.replace(new RegExp(from.charAt(i), "g"), to.charAt(i))
					i++
				# remove invalid chars
				# collapse whitespace and replace by -
				str = str.replace(/[^a-z0-9 -]/g, "").replace(/\s+/g, "-").replace(/-+/g, "-") # collapse dashes
				str
			slug string
		$scope.projectLongDesc = (project) ->
			"partials/#{project.category}/#{$scope.slug(project.name)}.html"
		$scope.projects = [
			id: 0
			name: 'Edupedia'
			year: 1998
			big: true
			thumbnail: true
			shortDesc: 'An online encylclopedia anyone can edit. Sound familiar? I had the idea way before the other guys, but trust me--it was much worse.'
			technologies: 'HTML, VisualPage'
			linkUrl: ''
			linkLabel: ''
			category: 'delights'
			showOnHomePage: true
		,
			id: 10
			name: 'Coolpages2000'
			year: 1999
			big: false
			thumbnail: true
			shortDesc: 'This early project stemmed from my excitement of learning how to do rollover image effects after reading through my father\'s computer books.'
			technologies: 'HTML, CSS, JavaScript'
			linkUrl: ''
			linkLabel: ''
			category: 'delights'
			showOnHomePage: true
		,
			id: 20
			name: 'Adeus'
			year: 2000
			big: false
			thumbnail: true
			shortDesc: 'Adeus was a command-line NLP bot inspired by A.L.I.C.E, an Artificial Intelligence conversation program.'
			technologies: 'QBASIC, DOS'
			linkUrl: ''
			linkLabel: ''
			category: 'delights'
			showOnHomePage: true
		,
			id: 30
			name: 'Fake Chat'
			year: 2001
			big: false
			thumbnail: true
			shortDesc: 'My first program written for the Sharp Wizard, a hinged digital organizer that could run apps.'
			technologies: 'BASIC'
			linkUrl: ''
			linkLabel: ''
			category: 'delights'
			showOnHomePage: true
		,
			id: 40
			name: 'Rogertoons'
			year: 2002
			big: false
			thumbnail: true
			shortDesc: 'A new obsession with Flash, drawing cartoons, banjo, and mandolin led this website and 4 minute animated cartoon.'
			technologies: 'Macromedia/Adobe Flash, ActionScript, Adobe Premiere Pro'
			linkUrl: ''
			linkLabel: ''
			category: 'delights'
			showOnHomePage: true
		,
			id: 50
			name: 'A21S'
			year: 2002
			big: false
			thumbnail: true
			shortDesc: 'My first mobile website was on this WindowsCE 1.0 device.'
			technologies: 'HTML, CSS, JavaScript'
			linkUrl: ''
			linkLabel: ''
			category: 'mobile'
			showOnHomePage: true
		,
			id: 60
			name: 'Vegan.FM'
			year: 2006
			big: false
			thumbnail: true
			shortDesc: 'This was both a website, social network, and native iPhone app that helped vegans look up any conceivable thing to determine if it\'s vegan (What the heck is ambergris?)'
			technologies: 'HTML, CSS, JavaScript, Joomla, Cocoa, XCode, PHP, MySQL, Adobe CS (phew!)'
			linkUrl: ''
			linkLabel: ''
			category: 'development'
			showOnHomePage: true
		,
			id: 70
			name: 'CreativeWorks'
			year: 2008
			big: true
			thumbnail: true
			shortDesc: 'CW was a turning point for my experience in full stack development. Helped in the creation of many websites for CW clients.'
			technologies: 'HTML, CSS, JavaScript, Adobe CS, in-person usability testing'
			linkUrl: ''
			linkLabel: ''
			category: 'development'
			showOnHomePage: true
		,
			id: 80
			name: 'Miscellarious'
			year: 2008
			big: false
			thumbnail: true
			shortDesc: 'Create rooms and post PostIt notes on the wall. Anyone can add or edit anything. Recently brought back to life with new code.'
			technologies: 'Wordpress, PHP, HTML, CSS, JavaScript, Adobe CS, Angular.JS (later)'
			linkUrl: ''
			linkLabel: ''
			category: 'development'
			showOnHomePage: true
		,
			id: 90
			name: 'Powabunga'
			year: 2010
			big: false
			thumbnail: true
			shortDesc: 'While working at a vegan spa in the South of France, I worked as a developer for the spa owners\' side project.'
			technologies: 'Java Spring MVC, HTML, CSS, JavaScript, Flash'
			linkUrl: 'http://powabunga.com'
			linkLabel: 'Go to Powabunga'
			category: 'development'
			showOnHomePage: true
		,
			id: 100
			name: 'LED Media'
			year: 2010
			big: false
			thumbnail: true
			shortDesc: 'Full technological and UX development of three online businesses for a small NJ-based startup.'
			technologies: 'Magento/Zend PHP, Wordpress, JavaScript/jQuery, CSS, HTML'
			linkUrl: ''
			linkLabel: ''
			category: 'design'
			showOnHomePage: true
		,
			id: 110
			name: 'The 5 Biggest Interface Screwups of 2010'
			year: 2010
			big: false
			thumbnail: false
			shortDesc: 'Guest article for UX Movement'
			technologies: ''
			linkUrl: 'http://uxmovement.com/thinking/the-5-biggest-interface-screw-ups-of-2010/'
			linkLabel: 'Read Article'
			category: 'design'
			showOnHomePage: true
		,
			id: 120
			name: 'PriorKnowledge'
			year: 2011
			big: false
			thumbnail: true
			shortDesc: 'Recently acquired by Salesforce, I designed and programmed a CMYK-loving brand for this Bayesian data predictive API'
			technologies: 'HTML, CSS, AdobeCS, Cinema4D'
			linkUrl: ''
			linkLabel: ''
			category: 'design'
			showOnHomePage: true
		,
			id: 130
			name: 'Kickstrap'
			year: 2011
			big: false
			thumbnail: true
			shortDesc: 'One of my most successful projects is the most popular fork of Bootstrap. This framework is a trusted resource of companies including Peugeot Citroën and Agile Harbor.'
			technologies: 'HTML, CSS, JavaScript, Bootstrap, Adobe CS'
			linkUrl: 'http://getkickstrap.com'
			linkLabel: 'Kickstrap Homepage'
			category: 'development'
			showOnHomePage: true
		,
			id: 140
			name: 'Kickstrap'
			year: 2011
			big: true
			thumbnail: true
			shortDesc: ''
			technologies: 'HTML, CSS, JavaScript, Bootstrap, Adobe CS'
			linkUrl: 'http://getkickstrap.com'
			linkLabel: 'Kickstrap Homepage'
			category: 'design'
			showOnHomePage: false
		,
			id: 150
			name: 'Ske.dj'
			year: 2011
			big: false
			thumbnail: true
			shortDesc: ''
			technologies: 'HTML, CSS, JavaScript, Axure RP, Adobe CS'
			linkUrl: 'http://ske.dj/'
			linkLabel: 'Go to Ske.dj'
			category: 'design'
			showOnHomePage: true
		,
			id: 160
			name: 'VeganKit'
			year: 2012
			big: true
			thumbnail: true
			shortDesc: 'Another of my most successful projects so far is this all-in-one and multilingual responsive website for vegans and those interested in going vegan.'
			technologies: 'Django, i18n, HTML, CSS, JavaScript, Python, Kickstrap, Axure RP, Persona development, in-person usability testing'
			linkUrl: 'http://vegankit.com'
			linkLabel: 'See VeganKit'
			category: 'mobile'
			showOnHomePage: true
		,
			id: 170
			name: 'VeganKit'
			year: 2012
			big: false
			thumbnail: true
			shortDesc: ''
			technologies: 'Django, i18n, HTML, CSS, JavaScript, Python, Kickstrap, Axure RP, Persona development, in-person usability testing'
			linkUrl: 'http://vegankit.com'
			linkLabel: 'See VeganKit'
			category: 'development'
			showOnHomePage: false
		,
			id: 180
			name: 'Lab95'
			year: 2012
			big: false
			thumbnail: true
			shortDesc: 'This advanced data-collection tool allows researchers to create individual collection "modules" which can be used alone or as clusters of other modules.'
			technologies: 'Ruby on Rails, HTML, CSS, JavaScript, AngularJS, Amazon S3, Kickstrap, in-person usability testing'
			linkUrl: ''
			linkLabel: ''
			category: 'delights'
			showOnHomePage: true
		,
			id: 190
			name: 'Ipreo'
			year: 2012
			big: true
			thumbnail: true
			shortDesc: 'Worked as the UX/UI Designer/Developer for Debtdomain.com, a loan syndication web application.'
			technologies: 'HTML, CSS, JavaScript, Silverback, Adobe CS, Paper Prototyping, remote and in-person usability testing, Axure RP, Balsamiq, Cinema4D, and some .NET and ColdFusion'
			linkUrl: ''
			linkLabel: ''
			category: 'development'
			showOnHomePage: true
		,
			id: 200
			name: 'Ipreo'
			year: 2012
			big: true
			thumbnail: true
			shortDesc: 'Worked as the UX/UI Designer/Developer for Debtdomain.com, a loan syndication web application.'
			technologies: 'HTML, CSS, JavaScript, Silverback, Adobe CS, Paper Prototyping, remote and in-person usability testing, Axure RP, Balsamiq, Cinema4D, and some .NET and ColdFusion'
			linkUrl: ''
			linkLabel: ''
			category: 'design'
			showOnHomePage: false
		,
			id: 210
			name: 'TinyGrowl'
			year: 2012
			big: false
			thumbnail: true
			shortDesc: 'A very simple jQuery plugin to create Growl-like messages in Bootstrap.'
			technologies: 'JavaScript/jQuery'
			linkUrl: 'https://github.com/ajkochanowicz/tinygrowl/'
			linkLabel: 'TinyGrowl on GitHub'
			category: 'development'
			showOnHomePage: true
		,
			id: 220
			name: '10 High Impact Usability Improvements'
			year: 2012
			big: false
			thumbnail: false
			shortDesc: 'Article written as guest expert for UserTesting.com'
			technologies: ''
			linkUrl: 'http://www.usertesting.com/blog/2012/04/24/10-high-impact-usability-improvements-part-1/'
			linkLabel: 'Read Article'
			category: 'design'
			showOnHomePage: true
		,
			id: 250
			name: 'Comedy Cellar'
			year: 2013
			big: false
			thumbnail: true
			shortDesc: 'Created a reservation ticket screen similar to iOS\'s Passbook. Increased sales to owner\'s neighboring bar.'
			technologies: 'Hype2, JavaScript, PHP'
			linkUrl: ''
			linkLabel: ''
			category: 'mobile'
			showOnHomePage: true
		,
			id: 260
			name: 'Comedy Cellar'
			year: 2013
			big: false
			thumbnail: true
			shortDesc: ''
			technologies: 'Hype2, JavaScript, PHP'
			linkUrl: ''
			linkLabel: ''
			category: 'design'
			showOnHomePage: false
		,
			id: 270
			name: 'UX Zen'
			year: 2013
			big: true
			thumbnail: true
			shortDesc: 'A zen-like daily affirmation of good UX.'
			techologies: 'Wordpress, HTML, CSS, JavaScript'
			linkUrl: 'http://adamkochanowicz.com/uxzen/'
			linkLabel: 'UX Zen'
			category: 'design'
			showOnHomePage: true
		,
			id: 280
			name: 'Campaign Breeze'
			year: 2013
			big: false
			thumbnail: true
			shortDesc: 'Complete rebranding and interaction redesign of this email campaign creation tool.'
			technologies: 'Axure RP, Adobe CS, in-person usability testing.'
			linkUrl: ''
			linkLabel: ''
			category: 'design'
			showOnHomePage: true
		,
			id: 290
			name: 'KBash'
			year: 2013
			big: false
			thumbnail: true
			shortDesc: 'A UNIX shell for the web. KBash creates a realistic-looking collapsible terminal that translates UNIX syntax to JavaScript.'
			technologies: 'HTML, CSS, JavaScript'
			linkUrl: 'http://ajkochanowicz.github.io/kbash/'
			linkLabel: 'Demo on GitHub'
			category: 'development'
			showOnHomePage: true
		,
			id: 300
			name: 'CSS Post Rendering'
			year: 2013
			big: false
			thumbnail: true
			shortDesc: 'A concept for loading pages quickly and elegantly by delaying non-essential CSS and images until after page load.'
			technologies: 'HTML, CSS, JavaScript, Kickstrap'
			linkUrl: 'http://ajkochanowicz.github.io/CSS-Post-Rendering/'
			linkLabel: 'Demo on GitHub'
			category: 'development'
			showOnHomePage: true
		,
			id: 310
			name: 'Email meta'
			year: 2013
			big: false
			thumbnail: false
			shortDesc: 'A standards document to contextualizing "types" of emails with an HTML meta tag. Because not all emails are messages.'
			technologies: 'On GitHub'
			linkUrl: 'https://github.com/ajkochanowicz/Email-Meta'
			linkLabel: 'See the specs on GitHub'
			category: 'development'
			showOnHomePage: true
		,
			id: 320
			name: 'Everything.io'
			year: 2013
			big: true
			thumbnail: true
			shortDesc: 'My most ambitious project is "The Operating System for your Stuff"--a platform for the control and inventory of smart and non-smart devices.'
			technologies: 'HTML, CSS, JavaScript, Firebase, Angular.js, Kickstrap 2, Java, Raspberry Pi, Arduino, Websockets, Ruby on Rails'
			linkUrl: 'http://cdn.everything.io/archive/'
			linkLabel: 'Everything.io Splash Page'
			category: 'development'
			showOnHomePage: true
		,
			id: 330
			name: 'Everything.io'
			year: 2013
			big: false
			thumbnail: true
			shortDesc: 'This command center for physical possessions needed to be as seamless as the mobile operating system itself.'
			technologies: 'HTML, CSS, JavaScript, Firebase, Angular.js, Kickstrap 2, Java, Raspberry Pi, Arduino, Websockets, Ruby on Rails'
			linkUrl: 'http://cdn.everything.io/archive'
			linkLabel: 'Everything.io Splash Page'
			category: 'mobile'
			showOnHomePage: false
		,
			id: 340
			name: 'Everything.io'
			year: 2013
			big: false
			thumbnail: true
			shortDesc: 'In EIO, I needed to cram a lot of information into a small space while ensuring a great User Experience.'
			technologies: 'HTML, CSS, JavaScript, Firebase, Angular.js, Kickstrap 2, Java, Raspberry Pi, Arduino, Websockets, Ruby on Rails'
			linkUrl: 'http://cdn.everything.io/archive'
			linkLabel: 'Everything.io Splash Page'
			category: 'design'
			showOnHomePage: false
		,
			id: 350
			name: 'Neo'
			year: 2014
			big: false
			thumbnail: false
			shortDesc: 'Just started at this amazing company. More on this later.'
			technologies: 'HTML, CSS, JavaScript, Ruby on Rails, ReactJS, Adobe CS, Swift'
			linkUrl: 'http://neo.com'
			linkLabel: 'Neo Homepage'
			category: 'development'
			showOnHomePage: true
		,
			id: 360
			name: 'Neo'
			year: 2014
			big: false
			thumbnail: false
			shortDesc: 'Just started at this amazing company. More on this later.'
			technologies: 'HTML, CSS, JavaScript, Ruby on Rails, ReactJS, Adobe CS, Swift'
			linkUrl: 'http://neo.com'
			linkLabel: 'Neo Homepage'
			category: 'mobile'
			showOnHomePage: false
		,
			id: 370
			name: 'Neo'
			year: 2014
			big: false
			thumbnail: false
			shortDesc: 'Just started at this amazing company. More on this later.'
			technologies: 'HTML, CSS, JavaScript, Ruby on Rails, ReactJS, Adobe CS, Swift'
			linkUrl: 'http://neo.com'
			linkLabel: 'Neo Homepage'
			category: 'design'
			showOnHomePage: false
		,
			id: 380
			name: 'Bitcoin Currency'
			year: 2014
			big: false
			thumbnail: false
			shortDesc: 'I created a functional set of denominational Bitcoin bills featuring great men and women of science.'
			technologies: 'Adobe CS'
			linkUrl: 'http://ajkochanowicz.github.io/bitcoinbills/'
			linkLabel: 'Bitcoin Denominational Currency'
			category: 'design'
			showOnHomePage: true
		,
			id: 390
			name: 'Everything is a Bottle Opener'
			year: 2014
			big: false
			thumbnail: false
			shortDesc: 'A blog dedicated simply to the many things that can be used as a bottle opener'
			technologies: 'Bottles, Chainsaws, Helicopters, Pens, etc.'
			linkUrl: 'http://everythingisabottleopener.tumblr.com/'
			linkLabel: 'everythingisabottleopener.tumblr.com'
			category: 'delights'
			showOnHomePage: true
		,
			id: 400
			name: 'mailto.ninja'
			year: 2014
			big: true
			thumbnail: false
			shortDesc: 'A stupidly simple solution to adding email sending to html'
			technologies: 'node.js, Coffeescript, Jade, Sass, Mailgun'
			linkUrl: 'http://mailto.ninja'
			linkLabel: 'mailto.ninja'
			category: 'development'
			showOnHomePage: true
		]
	]
