(function() {
  define(['./markup.txt!text', 'jquery'], function(markup, $) {
    return $('#ads').html('<br>' + markup);
  });

}).call(this);
