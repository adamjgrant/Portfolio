(function() {
  define(['angular', './controllers/index', './directives/index', './filters/index', 'angularFire', 'angular-route', 'ng-progress', './resources/ng-progress.css!'], function(angular) {
    return angular.module('app', ['app.controllers', 'app.directives', 'app.filters', 'firebase', 'ngRoute', 'ngProgress']).config([
      '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
        return $routeProvider.when('/', {
          templateUrl: '/partials/home.html'
        }).when('/delights', {
          templateUrl: '/partials/category.html'
        }).when('/mobile', {
          templateUrl: '/partials/category.html'
        }).when('/development', {
          templateUrl: '/partials/category.html'
        }).when('/ux', {
          templateUrl: '/partials/category.html'
        });
      }
    ]);
  });

}).call(this);
