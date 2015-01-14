var gulp = require('gulp');
var gutil = require('gulp-util');
var source = require('vinyl-source-stream');
var watchify = require('watchify');
var browserify = require('browserify');
var reactify = require('reactify');
var _ = require('lodash');

var FILES = ["node","done"];

gulp.task('watch', function() {
  watchify.args.fullPaths = false;
  _.each(FILES, function(file) {
    var bundler = watchify(browserify('./source/js/_' + file + '.js', watchify.args));

    bundler.on('update', rebundle);

    function rebundle() {
      return bundler.bundle()
        .on('error', gutil.log.bind(gutil, 'Browserify Error'))
        .pipe(source(file + '.js'))
        .pipe(gulp.dest('./source/js/'));
    }

    return rebundle();
  });
});
