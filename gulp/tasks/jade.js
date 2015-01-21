var gulp = require('gulp'),
  jade = require('gulp-jade'),
  changed = require('gulp-cached'),
  browserSync  = require('browser-sync');

var dest = './public';

gulp.task('jade', function() {
  var pages = ['mobile', 'development', 'delights', 'design'];
  for(var $i = 0; $i < pages.length; $i++) {
    var page = pages[$i];
    gulp.src(['./lib/jade/template/index.jade'])
      .pipe(jade({ locals: { page: page }}))
      .pipe(gulp.dest(dest + "/" + page))
  }

  return gulp.src(['./lib/jade/**/*.jade'])
    .pipe(changed(dest))
    .pipe(jade(
      {
        locals: {
          fs: require('fs')
        }
      })
    )
    .pipe(gulp.dest(dest));
});
