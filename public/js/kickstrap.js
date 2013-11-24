(function() {
  try {
    console.log('%cKickstrap', 'font-style:italic;font-family: helvetica neue, helvetica, sans-serif;font-size:20px;color:#FDD726;text-shadow:0 1px 0 #D1B43B,0 2px 0 #D1B43B,0 3px 0 #D1B43B,0 4px 0 #D1B43B,0 5px 0 #D1B43B,0 6px 1px rgba(30,28,23,.1),0 0 5px rgba(30,28,23,.1),0 1px 3px rgba(30,28,23,.3),0 3px 5px rgba(30,28,23,.2),0 5px 10px rgba(30,28,23,.25),0 10px 10px rgba(30,28,23,.2),0 20px 20px rgba(30,28,23,.15);');
  } catch (_error) {
    return;
  }

}).call(this);

(function() {
  jspm.config({
    endpoints: {
      ks: {
        location: './apps',
        normalize: function(name) {
          if (name.split('/').length === 1) {
            name = name + '/main';
          }
          return name;
        }
      }
    },
    map: {
      'jquery': 'jquery@2.0',
      'bootstrap': 'github:twbs/bootstrap@3.0.2/js/bootstrap',
      'angular': 'angular@1.2.0/angular',
      'angularFire': 'angularFire@0.3.1',
      'ang-app': 'ks:ang-app',
      'angular-route': 'ks:ang-app/resources/angular-route',
      'ng-progress': 'ks:ang-app/resources/ng-progress',
      'fontawesome': 'cdnjs:font-awesome/4.0.1/css/font-awesome.min.css!'
    },
    shim: {
      'cdnjs:angular.js/1.2.0/angular': {
        exports: 'angular'
      },
      'ks:ang-app/resources/angular-route': ['angular@1.2.0/angular'],
      'ks:ang-app/resources/ng-progress': ['angular@1.2.0/angular']
    }
  });

}).call(this);

(function() {
  window.extend = function(objA, objB) {
    var p;
    for (p in objB) {
      if (typeof objA[p] === "object") {
        extend(objA[p], objB[p]);
      } else {
        objA[p] = objB[p];
      }
    }
    return objA;
  };

}).call(this);

(function() {
  var jspmResources, k$, k$settings;

  k$settings = extend({
    theme: 'bootstrap',
    mode: 'dev',
    firebaseName: 'kickstrap-demo',
    version: '2.0.0 alpha'
  }, window.k$ || {});

  k$ = window.k$ = function() {};

  k$.loadApp = function() {};

  k$.settings = k$settings;

  k$.app = function(name, options) {
    var htmlElement;
    htmlElement = document.body.childNodes[document.body.childNodes.length - 3];
    return jspm["import"](name, function(app) {
      return app.attach(htmlElement, options);
    });
  };

  k$.readyFxs = [];

  k$.ready = function(fx) {
    return k$.readyFxs.push(fx);
  };

  jspmResources = ['jquery', 'angular', 'bootstrap'];

  if (k$.settings.mode === 'dev') {
    jspm.config.urlArgs = '?bust=' + new Date().getTime();
  }

  jspmResources = jspmResources.concat(k$settings.apps);

  /*
  # Add Angular Resources
  controllers = []
  controllers.concat './ang-app/controllers/' + ctrl for ctrl in k$.settings.controllers
  console.log controllers
  jspmResources = jspmResources.concat controllers
  */


  jspm["import"](jspmResources, function($, angular, app) {
    return $(document).ready(function() {
      var i;
      document.body.className += 'loaded';
      angular.bootstrap(document, ['app']);
      i = 0;
      while (i < k$.readyFxs.length) {
        k$.readyFxs[i]();
        i++;
      }
      return k$.ready = function(fx) {
        return fx();
      };
    });
  });

}).call(this);
