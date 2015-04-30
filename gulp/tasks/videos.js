var newer    = require('gulp-newer');
var gulp       = require('gulp');

gulp.task('videos', function() {
  var dest = './public/videos';

  return gulp.src('./lib/videos/**/*')
    .pipe(newer(dest)) // Ignore unchanged files
    .pipe(gulp.dest(dest));
});
