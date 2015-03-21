gulp = require('gulp')
del = require('del')
sass = require('gulp-sass')
webserver = require('gulp-webserver')

gulp.task('sass', ->
    gulp.src('./assets/styles/**/*.sass')
    .pipe(sass({indentedSyntax: true, sourceComments: 'normal'}))
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
