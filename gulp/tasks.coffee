gulp = require('gulp')
del = require('del')
sass = require('gulp-sass')
webserver = require('gulp-webserver')
es = require('event-stream')
concat = require('gulp-concat')
bower = require('gulp-bower')

gulp.task('bower', ->
  bower()
)

gulp.task('sass', ['bower'], ->
    vendorFiles = gulp.src('./bower_components/normalize.css/normalize.css')

    applicationFiles = gulp.src('./assets/styles/**/*.sass')
      .pipe(sass({indentedSyntax: true, sourceComments: 'normal'}))

    es.concat(vendorFiles, applicationFiles)
      .pipe(concat('mcw.css'))
      .pipe(gulp.dest('./build/css'))
)

gulp.task('clean', ->
    del(['./build/**'])
)

gulp.task('build', ['sass'])

gulp.task('server', ['clean', 'build'], ->
    gulp.src(['html', 'build'])
      .pipe(webserver())
)

gulp.task('watch', ['server'], ->
  gulp.watch('./assets/**/*.sass', ['sass'])
)
