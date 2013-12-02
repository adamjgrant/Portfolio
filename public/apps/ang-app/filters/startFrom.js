(function() {
  define(['./module'], function(filters) {
    return filters.filter('startFrom', [
      function() {
        return function(input, start) {
          start = +start;
          return input.slice(start);
        };
      }
    ]);
  });

}).call(this);
