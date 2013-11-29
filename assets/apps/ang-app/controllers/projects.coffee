define ['./module'], (controllers) ->
	controllers.controller 'ProjectsCtrl', ['$scope', 'angularFire', 'ngProgress', '$location', '$anchorScroll', ($scope, angularFire, ngProgress, $location, $anchorScroll) ->
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
			shortDesc: 'An online encylclopedia anyone can edit. Sound familiar? I had the idea way before the other guys, but trust me--it was much worse.'
			technologies: 'HTML, VisualPage'
			category: 'delights'
			showOnHomePage: true
		,
			id: 1
			name: 'Coolpages2000'
			year: 1999
			big: false
			shortDesc: 'This early project stemmed from my excitement of learning how to do rollover image effects after reading through my father\'s computer books.'
			technologies: 'HTML, CSS, JavaScript'
			category: 'delights'
			showOnHomePage: true
		,
			id: 2
			name: 'Adeus'
			year: 2000
			big: false
			shortDesc: 'Adeus was a command-line NLP bot inspired by A.L.I.C.E, an Artificial Intelligence conversation program.'
			technologies: 'QBASIC, DOS'
			category: 'delights'
			showOnHomePage: true
		,
			id: 3
			name: 'Fake Chat'
			year: 2001
			big: false
			shortDesc: 'My first program written for the Sharp Wizard, a hinged digital organizer that could run apps.'
			technologies: 'BASIC'
			category: 'delights'
			showOnHomePage: true
		,
			id: 4
			name: 'Rogertoons'
			year: 2002
			big: false
			shortDesc: 'A new obsession with Flash, drawing cartoons, banjo, and mandolin led this website and 4 minute animated cartoon.'
			technologies: 'Macromedia/Adobe Flash, ActionScript, Adobe Premiere Pro'
			category: 'delights'
			showOnHomePage: true
		,	
			id: 5
			name: 'A21S'
			year: 2002
			big: false
			shortDesc: 'My first mobile website was on this WindowsCE 1.0 device.'
			technologies: 'HTML, CSS, JavaScript'
			category: 'mobile'
			showOnHomePage: true
		,
			id: 6
			name: 'Vegan.FM'
			year: 2006
			big: false
			shortDesc: 'This was both a website, social network, and native iPhone app that helped vegans look up any conceivable thing to determine if it\'s vegan (What the heck is ambergris?)'
			technologies: 'HTML, CSS, JavaScript, Joomla, Cocoa, XCode, PHP, MySQL, Adobe CS (phew!)'
			category: 'development'
			showOnHomePage: true
		,
			id: 7
			name: 'CreativeWorks'
			year: 2008
			big: true
			shortDesc: 'CW was a turning point for my experience in full stack development. Helped in the creation of many websites for CW clients.'
			technologies: 'HTML, CSS, JavaScript, Adobe CS, in-person usability testing'
			category: 'development'
			showOnHomePage: true
		,
			id: 8
			name: 'CreativeWorks'
			year: 2008
			big: false
			shortDesc: ''
			technologies: 'HTML, CSS, JavaScript, Adobe CS, in-person usability testing'
			category: 'design'
			showOnHomePage: false
		,
			id: 9
			name: 'Miscellarious'
			year: 2008
			big: false
			shortDesc: 'Create rooms and post PostIt notes on the wall. Anyone can add or edit anything. Recently brought back to life with new code.'
			technologies: 'Wordpress, PHP, HTML, CSS, JavaScript, Adobe CS, Angular.JS (later)'
			category: 'development'
			showOnHomePage: true
		,
			id: 10
			name: 'Powabunga'
			year: 2010
			big: false
			shortDesc: 'While working at a vegan spa in the South of France, I worked as a developer for the spa owners\' side project.'
			technologies: 'Java Spring MVC, HTML, CSS, JavaScript, Flash'
			category: 'development'
			showOnHomePage: true
		,
			id: 11
			name: 'LED Media'
			year: 2010
			big: false
			shortDesc: 'Full technological and UX development of three online businesses for a small NJ-based startup.'
			technologies: 'Magento/Zend PHP, Wordpress, JavaScript/jQuery, CSS, HTML'
			category: 'design'
			showOnHomePage: true
		,
			id: 12
			name: 'PriorKnowledge'
			year: 2011
			big: false
			shortDesc: 'Recently acquired by Salesforce, I designed and programmed a CMYK-loving brand for this Bayesian data predictive API'
			technologies: 'HTML, CSS, AdobeCS, Cinema4D'
			category: 'design'
			showOnHomePage: true
		,
			id: 14
			name: 'Kickstrap'
			year: 2011
			big: false
			shortDesc: 'One of my most successful projects is the most popular fork of Bootstrap. This framework is a trusted resource of companies including Peugeot Citroën and Agile Harbor.'
			technologies: 'HTML, CSS, JavaScript, Bootstrap, Adobe CS'
			category: 'development'
			showOnHomePage: true
		,
			id: 15
			name: 'Kickstrap'
			year: 2011
			big: true
			shortDesc: ''
			technologies: 'HTML, CSS, JavaScript, Bootstrap, Adobe CS'
			category: 'design'
			showOnHomePage: false
		,
			id: 17
			name: 'Ske.dj'
			year: 2011
			big: false
			shortDesc: ''
			technologies: 'HTML, CSS, JavaScript, Axure RP, Adobe CS'
			category: 'design'
			showOnHomePage: true
		,
			id: 18
			name: 'VeganKit'
			year: 2012
			big: true
			shortDesc: 'Another of my most successful projects so far is this all-in-one and multilingual responsive website for vegans and those interested in going vegan.'
			technologies: 'Django, i18n, HTML, CSS, JavaScript, Python, Kickstrap, Axure RP, Persona development, in-person usability testing'
			category: 'mobile'
			showOnHomePage: true
		,
			id: 19
			name: 'VeganKit'
			year: 2012
			big: false
			shortDesc: ''
			technologies: 'Django, i18n, HTML, CSS, JavaScript, Python, Kickstrap, Axure RP, Persona development, in-person usability testing'
			category: 'development'
			showOnHomePage: false
		,
			id: 20
			name: 'Lab95'
			year: 2012
			big: false
			shortDesc: 'This advanced data-collection tool allows researchers to create individual collection "modules" which can be used alone or as clusters of other modules.'
			technologies: 'Ruby on Rails, HTML, CSS, JavaScript, AngularJS, Amazon S3, Kickstrap, in-person usability testing'
			category: 'delights'
			showOnHomePage: true
		,
			id: 21
			name: 'Ipreo'
			year: 2012
			big: true
			shortDesc: 'Worked as the UX/UI Designer/Developer for Debtdomain.com, a loan syndication web application.'
			technologies: 'HTML, CSS, JavaScript, Silverback, Adobe CS, Paper Prototyping, remote and in-person usability testing, Axure RP, Balsamiq, Cinema4D, and some .NET and ColdFusion'
			category: 'development'
			showOnHomePage: true
		,
			id: 22
			name: 'Ipreo'
			year: 2012
			big: true
			shortDesc: 'Worked as the UX/UI Designer/Developer for Debtdomain.com, a loan syndication web application.'
			technologies: 'HTML, CSS, JavaScript, Silverback, Adobe CS, Paper Prototyping, remote and in-person usability testing, Axure RP, Balsamiq, Cinema4D, and some .NET and ColdFusion'
			category: 'design'
			showOnHomePage: false
		,
			id: 23
			name: 'TinyGrowl'
			year: 2012
			big: false
			shortDesc: 'A very simple jQuery plugin to create Growl-like messages in Bootstrap.'
			technologies: 'JavaScript/jQuery'
			category: 'development'
			showOnHomePage: true
		,
			id: 24
			name: 'Casey Dellas'
			year: 2013
			big: false
			shortDesc: 'I created this static and responsive website for a Fitness trainer'
			technologies: 'HTML, CSS, JavaScript, jQuery UI, Kickstrap, Remote and in-person usability testing, Axure RP'
			category: 'development'
			showOnHomePage: true
		,
			id: 25
			name: 'Casey Dellas'
			year: 2013
			big: false
			shortDesc: ''
			technologies: 'HTML, CSS, JavaScript, jQuery UI, Kickstrap, Remote and in-person usability testing, Axure RP'
			category: 'mobile'
			showOnHomePage: false
		,
			id: 26
			name: 'Comedy Cellar'
			year: 2013
			big: false
			shortDesc: 'Created a reservation ticket screen similar to iOS\'s Passbook. Increased sales to owner\'s neighboring bar.'
			technologies: 'Hype2, JavaScript, PHP'
			category: 'mobile'
			showOnHomePage: true
		,
			id: 27
			name: 'Comedy Cellar'
			year: 2013
			big: false
			shortDesc: ''
			technologies: 'Hype2, JavaScript, PHP'
			category: 'design'
			showOnHomePage: false
		,
			id: 28
			name: 'UX Zen'
			year: 2013
			big: true
			shortDesc: 'A zen-like daily affirmation of good UX.'
			techologies: 'Wordpress, HTML, CSS, JavaScript'
			category: 'design'
			showOnHomePage: true
		,
			id: 29
			name: 'Campaign Breeze'
			year: 2013
			big: false
			shortDesc: 'Complete rebranding and interaction redesign of this email campaign creation tool.'
			technologies: 'Axure RP, Adobe CS, in-person usability testing.'
			category: 'design'
			showOnHomePage: true
		,
			id: 30
			name: 'KBash'
			year: 2013
			big: false
			shortDesc: 'A UNIX shell for the web. KBash creates a realistic-looking collapsible terminal that translates UNIX syntax to JavaScript.'
			technologies: 'HTML, CSS, JavaScript'
			category: 'development'
			showOnHomePage: true
		,
			id: 31
			name: 'CSS Post Rendering'
			year: 2013
			big: false
			shortDesc: 'A concept for loading pages quickly and elegantly by delaying non-essential CSS and images until after page load.'
			technologies: 'HTML, CSS, JavaScript, Kickstrap'
			category: 'development'
			showOnHomePage: true
		,
			id: 32
			name: 'Email meta'
			year: 2013
			big: false
			shortDesc: 'A standards document to contextualizing "types" of emails with an HTML meta tag. Because not all emails are messages.'
			technologies: ''
			category: 'development'
			showOnHomePage: true
		,
			id: 33
			name: 'Everything.io'
			year: 2013
			big: true
			shortDesc: 'My most ambitious project is "The Operating System for your Stuff"--a platform for the control and inventory of smart and non-smart devices.'
			technologies: 'HTML, CSS, JavaScript, Firebase, Angular.js, Kickstrap 2, Java, Raspberry Pi, Arduino, Websockets, Ruby on Rails'
			category: 'development'
			showOnHomePage: true
		,
			id: 34
			name: 'Everything.io'
			year: 2013
			big: false
			shortDesc: 'This command center for physical possessions needed to be as seamless as the mobile operating system itself.'
			technologies: 'HTML, CSS, JavaScript, Firebase, Angular.js, Kickstrap 2, Java, Raspberry Pi, Arduino, Websockets, Ruby on Rails'
			category: 'mobile'
			showOnHomePage: false
		,
			id: 35
			name: 'Everything.io'
			year: 2013
			big: false
			shortDesc: 'In EIO, I needed to cram a lot of information into a small space while ensuring a great User Experience.'
			technologies: 'HTML, CSS, JavaScript, Firebase, Angular.js, Kickstrap 2, Java, Raspberry Pi, Arduino, Websockets, Ruby on Rails'
			category: 'design'
			showOnHomePage: false
		]
	]