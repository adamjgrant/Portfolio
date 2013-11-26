(function() {
  define(['./module'], function(controllers) {
    return controllers.controller('ProjectsCtrl', [
      '$scope', 'angularFire', 'ngProgress', '$location', '$anchorScroll', function($scope, angularFire, ngProgress, $location, $anchorScroll) {
        $scope.categories = [
          {
            name: 'Delights',
            slug: 'delights',
            lead: 'Lorem ipsum dolor sit amet',
            desc: 'blah blah blah, latin is a dead language anyway.'
          }, {
            name: 'Mobile Experiences',
            slug: 'mobile',
            lead: 'Lorem ipsum dolor sit amet',
            desc: 'blah blah blah, latin is a dead language anyway.'
          }, {
            name: 'Full Stack Development',
            slug: 'development',
            lead: 'Lorem ipsum dolor sit amet',
            desc: 'blah blah blah, latin is a dead language anyway.'
          }, {
            name: 'UX Design',
            slug: 'ux',
            lead: 'Lorem ipsum dolor sit amet',
            desc: 'blah blah blah, latin is a dead language anyway.'
          }
        ];
        $scope.$on('$locationChangeSuccess', function() {
          setTimeout(function() {
            return $('.affixer').affix({
              offset: {
                top: 250
              }
            });
          }, 500);
          console.log('ping');
          return true;
        });
        $scope.setLocation = function(path, id, immediate) {
          var waitTime;
          waitTime = 0;
          $location.path(path);
          if (!immediate) {
            $('html, body').animate({
              scrollTop: $('body').offset().top
            }, 0);
            waitTime = 750;
          }
          return setTimeout(function() {
            return $('html, body').animate({
              scrollTop: $('#' + id).offset().top - 150
            }, 200);
          }, waitTime);
        };
        $scope.selectedCategory = function() {
          var a, catIndex, catSlug;
          if ($location.path() === '/') {
            a = {
              slug: 'home',
              name: 'Home'
            };
            return a;
          } else {
            catSlug = $location.path().substr(1, $location.path().length);
            catIndex = 0;
            $.grep($scope.categories, function(e, i) {
              if (e.slug === catSlug) {
                return catIndex = i;
              }
            });
            return $scope.categories[catIndex];
          }
        };
        $scope.slug = function(string) {
          var slug;
          slug = function(str) {
            var from, i, l, to;
            str = str.replace(/^\s+|\s+$/g, "");
            str = str.toLowerCase();
            from = "ãàáäâẽèéëêìíïîõòóöôùúüûñç·/_,:;";
            to = "aaaaaeeeeeiiiiooooouuuunc------";
            i = 0;
            l = from.length;
            while (i < l) {
              str = str.replace(new RegExp(from.charAt(i), "g"), to.charAt(i));
              i++;
            }
            str = str.replace(/[^a-z0-9 -]/g, "").replace(/\s+/g, "-").replace(/-+/g, "-");
            return str;
          };
          return slug(string);
        };
        $scope.projectLongDesc = function(project) {
          return "partials/" + project.category + "/" + ($scope.slug(project.name)) + ".html";
        };
        return $scope.projects = [
          {
            name: 'Edupedia',
            year: 1998,
            employer: false,
            shortDesc: 'An online encylclopedia anyone can edit. Sound familiar? I had the idea way before the other guys, but trust me--it was much worse.',
            technologies: 'HTML, VisualPage',
            category: 'delights',
            duplicate: false
          }, {
            name: 'Coolpages2000',
            year: 1999,
            employer: false,
            shortDesc: 'This early project stemmed from my excitement of learning how to do rollover image effects after reading through my father\'s computer books.',
            technologies: 'HTML, CSS, JavaScript',
            category: 'delights',
            duplicate: false
          }, {
            name: 'Adeus',
            year: 2000,
            employer: false,
            shortDesc: 'Adeus was a command-line NLP bot inspired by A.L.I.C.E, an Artificial Intelligence conversation program.',
            technologies: 'QBASIC, DOS',
            category: 'delights',
            duplicate: false
          }, {
            name: 'Fake Chat',
            year: 2001,
            employer: false,
            shortDesc: 'My first program written for the Sharp Wizard, a hinged digital organizer that could run apps.',
            technologies: 'BASIC',
            category: 'delights',
            duplicate: false
          }, {
            name: 'Rogertoons',
            year: 2002,
            employer: false,
            shortDesc: 'A new obsession with Flash, drawing cartoons, banjo, and mandolin led this website and 4 minute animated cartoon.',
            technologies: 'Macromedia/Adobe Flash, ActionScript, Adobe Premiere Pro',
            category: 'delights',
            duplicate: false
          }, {
            name: 'A21S',
            year: 2002,
            employer: false,
            shortDesc: 'My first mobile website was on this WindowsCE 1.0 device.',
            technologies: 'HTML, CSS, JavaScript',
            category: 'mobile',
            duplicate: false
          }, {
            name: 'Vegan.FM',
            year: 2006,
            employer: false,
            shortDesc: 'This was both a website, social network, and native iPhone app that helped vegans look up any conceivable thing to determine if it\'s vegan (What the heck is ambergris?)',
            technologies: 'HTML, CSS, JavaScript, Joomla, Cocoa, XCode, PHP, MySQL, Adobe CS (phew!)',
            category: 'development',
            duplicate: false
          }, {
            name: 'CreativeWorks',
            year: 2008,
            employer: true,
            shortDesc: 'CW was a turning point for my experience in full stack development. Helped in the creation of many websites for CW clients.',
            technologies: 'HTML, CSS, JavaScript, Adobe CS, in-person usability testing',
            category: 'development',
            duplicate: false
          }, {
            name: 'CreativeWorks',
            year: 2008,
            employer: true,
            shortDesc: '',
            technologies: '',
            category: 'ux',
            duplicate: true
          }, {
            name: 'Miscellarious',
            year: 2008,
            employer: false,
            shortDesc: 'Create rooms and post PostIt notes on the wall. Anyone can add or edit anything. Recently brought back to life with new code.',
            technologies: 'Wordpress, PHP, HTML, CSS, JavaScript, Adobe CS, Angular.JS (later)',
            category: 'development',
            duplicate: false
          }, {
            name: 'Powabunga',
            year: 2010,
            employer: true,
            shortDesc: 'While working at a vegan spa in the South of France, I worked as a developer for the spa owners\' side project.',
            technologies: 'Java Spring MVC, HTML, CSS, JavaScript, Flash',
            category: 'development',
            duplicate: false
          }, {
            name: 'PriorKnowledge',
            year: 2011,
            employer: true,
            shortDesc: 'Recently acquired by Salesforce, I designed and programmed a CMYK-loving brand for this Bayesian data predictive API',
            technologies: 'HTML, CSS, AdobeCS, Cinema4D',
            category: 'ux',
            duplicate: false
          }, {
            name: 'PriorKnowledge',
            year: 2011,
            employer: true,
            shortDesc: '',
            technologies: '',
            category: 'development',
            duplicate: true
          }, {
            name: 'Kickstrap',
            year: 2011,
            employer: false,
            shortDesc: 'One of my most successful projects is the most popular fork of Bootstrap. This framework is a trusted resource of companies including Peugeot Citroën and Agile Harbor.',
            technologies: 'HTML, CSS, JavaScript, Bootstrap, Adobe CS',
            category: 'development',
            duplicate: false
          }, {
            name: 'Kickstrap',
            year: 2011,
            employer: false,
            shortDesc: '',
            technologies: '',
            category: 'ux',
            duplicate: true
          }, {
            name: 'Ske.dj',
            year: 2011,
            employer: true,
            shortDesc: 'UI/UX Designer/Developer for this social event calendar startup.',
            technologies: 'HTML, CSS, JavaScript, Axure RP, Adobe CS',
            category: 'development',
            duplicate: false
          }, {
            name: 'Ske.dj',
            year: 2011,
            employer: true,
            shortDesc: '',
            technologies: '',
            category: 'ux',
            duplicate: true
          }, {
            name: 'VeganKit',
            year: 2012,
            employer: false,
            shortDesc: 'Another of my most successful projects so far is this all-in-one and multilingual responsive website for vegans and those interested in going vegan.',
            technologies: 'Django, i18n, HTML, CSS, JavaScript, Python, Kickstrap, Axure RP, Persona development, in-person usability testing',
            category: 'mobile',
            duplicate: false
          }, {
            name: 'VeganKit',
            year: 2012,
            employer: false,
            shortDesc: '',
            technologies: '',
            category: 'ux',
            duplicate: true
          }, {
            name: 'Lab95',
            year: 2012,
            employer: false,
            shortDesc: 'This advanced data-collection tool allows researchers to create individual collection "modules" which can be used alone or as clusters of other modules.',
            technologies: 'Ruby on Rails, HTML, CSS, JavaScript, AngularJS, Amazon S3, Kickstrap, in-person usability testing',
            category: 'delights',
            duplicate: false
          }, {
            name: 'Ipreo',
            year: 2012,
            employer: true,
            shortDesc: 'Worked as the UX/UI Designer/Developer for Debtdomain.com, a loan syndication web application.',
            technologies: 'HTML, CSS, JavaScript, Silverback, Adobe CS, Paper Prototyping, remote and in-person usability testing, Axure RP, Balsamiq, Cinema4D, and some .NET and ColdFusion',
            category: 'development',
            duplicate: false
          }, {
            name: 'TinyGrowl',
            year: 2012,
            employer: false,
            shortDesc: 'A very simple jQuery plugin to create Growl-like messages in Bootstrap.',
            technologies: 'JavaScript/jQuery',
            category: 'development',
            duplicate: false
          }, {
            name: 'Casey Dellas',
            year: 2013,
            employer: false,
            shortDesc: 'I created this static and responsive website for a Fitness trainer',
            technologies: 'HTML, CSS, JavaScript, jQuery UI, Kickstrap, Remote and in-person usability testing, Axure RP',
            category: 'development',
            duplicate: false
          }, {
            name: 'Casey Dellas',
            year: 2013,
            employer: false,
            shortDesc: '',
            technologies: '',
            category: 'mobile',
            duplicate: true
          }, {
            name: 'Comedy Cellar',
            year: 2013,
            employer: false,
            shortDesc: 'Created a reservation ticket screen similar to iOS\'s Passbook. Increased sales to owner\'s neighboring bar.',
            technologies: 'Hype2, JavaScript, PHP',
            category: 'mobile',
            duplicate: false
          }, {
            name: 'Comedy Cellar',
            year: 2013,
            employer: false,
            shortDesc: '',
            technologies: '',
            category: 'ux',
            duplicate: true
          }, {
            name: 'UX Zen',
            year: 2013,
            employer: false,
            shortDesc: 'A zen-like daily affirmation of good UX.',
            techologies: 'Wordpress, HTML, CSS, JavaScript',
            category: 'ux',
            duplicate: false
          }, {
            name: 'Campaign Breeze',
            year: 2013,
            employer: true,
            shortDesc: 'Complete rebranding and interaction redesign of this email campaign creation tool.',
            technologies: 'Axure RP, Adobe CS, in-person usability testing.',
            category: 'ux',
            duplicate: false
          }, {
            name: 'KBash',
            year: 2013,
            employer: false,
            shortDesc: 'A UNIX shell for the web. KBash creates a realistic-looking collapsible terminal that translates UNIX syntax to JavaScript.',
            technologies: 'HTML, CSS, JavaScript',
            category: 'development',
            duplicate: false
          }, {
            name: 'CSS Post Rendering',
            year: 2013,
            employer: false,
            shortDesc: 'A concept for loading pages quickly and elegantly by delaying non-essential CSS and images until after page load.',
            technologies: 'HTML, CSS, JavaScript, Kickstrap',
            category: 'development',
            duplicate: false
          }, {
            name: 'Email meta',
            year: 2013,
            employer: false,
            shortDesc: 'A standards document to contextualizing "types" of emails with an HTML meta tag. Because not all emails are messages.',
            technologies: '',
            category: 'ux',
            duplicate: false
          }, {
            name: 'Everything.io',
            year: 2013,
            employer: false,
            shortDesc: 'My most ambitious project is "The Operating System for your Stuff"--a platform for the control and inventory of smart and non-smart devices.',
            technologies: 'HTML, CSS, JavaScript, Firebase, Angular.js, Kickstrap 2, Java, Raspberry Pi, Arduino, Websockets, Ruby on Rails',
            category: 'development',
            duplicate: false
          }, {
            name: 'Everything.io',
            year: 2013,
            employer: false,
            shortDesc: '',
            technologies: '',
            category: 'mobile',
            duplicate: true
          }, {
            name: 'Everything.io',
            year: 2013,
            employer: false,
            shortDesc: '',
            technologies: '',
            category: 'ux',
            duplicate: true
          }
        ];
      }
    ]);
  });

}).call(this);
