(function() {
  define(['./module'], function(controllers) {
    return controllers.controller('SectionsCtrl', [
      '$scope', 'angularFire', '$location', 'ngProgress', function($scope, angularFire, $location, ngProgress) {
        ngProgress.start();
        $scope.sections = [
          {
            name: 'Features',
            path: 'features'
          }, {
            name: 'First Steps',
            path: 'first-steps'
          }, {
            name: 'Creating Pages',
            path: 'pages'
          }, {
            name: 'Creating Partials',
            path: 'partials'
          }, {
            name: 'Creating Apps',
            path: 'apps'
          }, {
            name: 'Creating Angular Templates',
            path: 'templates'
          }, {
            name: 'Compiling in Roots',
            path: 'roots'
          }, {
            name: 'Intro to CoffeeScript',
            path: 'coffeescript'
          }, {
            name: 'Intro to Stylus',
            path: 'stylus'
          }, {
            name: 'Intro to Jade',
            path: 'jade'
          }, {
            name: 'Acknowledgments',
            path: 'acknowledgments'
          }
        ];
        $scope.selectedSection = $scope.sections[0];
        $scope.setSelectedSection = function(section) {
          $scope.selectedSection = section;
          return $location.path(section.path);
        };
        $scope.$on('$locationChangeSuccess', function() {
          var path, sectionIndex;
          path = $location.path();
          path = path.substr(1, path.length);
          sectionIndex = null;
          $.grep($scope.sections, function(e, i) {
            if (e.path === path) {
              return sectionIndex = i;
            }
          });
          return $scope.setSelectedSection($scope.sections[sectionIndex]);
        });
        $scope.themes = [
          {
            name: 'amelia',
            title: 'Amelia*'
          }, {
            name: 'bootstrap',
            title: 'Bootstrap Default'
          }, {
            name: 'cerulean',
            title: 'Cerulean*'
          }, {
            name: 'cosmo',
            title: 'Cosmo*'
          }, {
            name: 'cyborg',
            title: 'Cyborg*'
          }, {
            name: 'flatly',
            title: 'Flatly*'
          }, {
            name: 'kickstrap',
            title: 'Kickstrap Default'
          }, {
            name: 'journal',
            title: 'Journal*'
          }, {
            name: 'readable',
            title: 'Readable*'
          }, {
            name: 'simplex',
            title: 'Simplex*'
          }, {
            name: 'slate',
            title: 'Slate*'
          }, {
            name: 'spacelab',
            title: 'Spacelab*'
          }, {
            name: 'united',
            title: 'United*'
          }
        ];
        $scope.themePreviewUrl = '';
        $scope.setTheme = function(name) {
          $scope.themePreviewUrl = './themes/' + name + '.css';
          if (name === 'bootstrap') {
            $scope.themePreviewUrl = './css/bootstrap.css';
          }
          return k$.demoStylesheet();
        };
        $scope.nodemo = function() {
          return $.growl({
            title: 'Looking for a demo?',
            text: '<p>You\'re there. We\'ve made our downloadable the exact same as getkickstrap.com.</p>\
					<p>This page is 100% Kickstrap.</p>',
            type: 'success'
          });
        };
        $scope.setPong = function() {
          ngProgress.start();
          return jspm["import"]('ks:pong', function() {
            return ngProgress.complete();
          });
        };
        return ngProgress.complete();
      }
    ]);
  });

}).call(this);
