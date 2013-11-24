(function() {
  define(['./module'], function(controllers) {
    return controllers.controller('DemoCtrl', [
      '$scope', 'angularFire', 'ngProgress', function($scope, angularFire, ngProgress) {
        $scope.fName = ' ';
        $scope.lName = ' ';
        return $scope.fullName = function() {
          return $scope.fName + ' ' + $scope.lName;
        };
      }
    ]);
  });

}).call(this);
