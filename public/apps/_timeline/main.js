(function() {
  define(['./timeline.min', './timeline_light.css!', './timeline.css!', 'ks:ang-app/controllers/projects'], function(Timeline) {
    var timeline;
    console.log(Timeline);
    timeline = new Timeline($('#timeline'), k$.projects);
    return timeline.display();
  });

}).call(this);
