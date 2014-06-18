define [
	'angular'
	# 'angularFire'
	'angular-route'
	'ngProgress'
	# './resources/ng-progress.css!'
], (angular) ->
	angular.module('app', [
		'app.controllers'
		'app.directives'
		'app.filters'
		# 'firebase'
		'ngRoute'
		'ngProgress'
	]).config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
		$routeProvider
			.when '/',
				templateUrl: '/partials/home.html'
			.when '/delights',
				templateUrl: '/partials/category.html'
			.when '/mobile',
				templateUrl: '/partials/category.html'
			.when '/development',
				templateUrl: '/partials/category.html'
			.when '/design',
				templateUrl: '/partials/category.html'
	]
