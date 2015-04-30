var gulp = require('gulp'),
  jade = require('gulp-jade'),
  changed = require('gulp-cached'),
  browserSync  = require('browser-sync'),
  fs = require('fs');

var dest = './public';

gulp.task('jade', function() {
  var pages = ['mobile', 'development', 'delights', 'design'];
  for(var $i = 0; $i < pages.length; $i++) {
    var page = pages[$i];
    gulp.src(['./lib/jade/template/index.jade'])
      .pipe(jade({ locals: { page: page }}))
      .pipe(gulp.dest(dest + "/" + page))
  }

  gulp.src(['./lib/jade/index.jade'])
    .pipe(jade({ locals: { 
      page: 'home',
      fs: fs
    }}))
    .pipe(gulp.dest(dest + "/" ))

  return gulp.src(['./lib/jade/{bio,delights,design,development,mobile}/**/*.jade'])
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
