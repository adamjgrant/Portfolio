(function() {
  define(['angular', 'angular-route', 'ngProgress'], function(angular) {
    return angular.module('app', ['app.controllers', 'app.directives', 'app.filters', 'ngRoute', 'ngProgress']).config([
      '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
        return $routeProvider.when('/', {
          templateUrl: '/partials/home.html'
        }).when('/delights', {
          templateUrl: '/partials/category.html'
        }).when('/mobile', {
          templateUrl: '/partials/category.html'
        }).when('/development', {
          templateUrl: '/partials/category.html'
        }).when('/design', {
          templateUrl: '/partials/category.html'
        });
      }
    ]);
  });

}).call(this);
