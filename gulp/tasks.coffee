gulp = require('gulp')
del = require('del')
sass = require('gulp-sass')

gulp.task('sass', ->
    gulp.src('./assets/styles/**/*.sass')
    .pipe(sass({indentedSyntax: true, sourceComments: 'normal'}))
    .pipe(gulp.dest('./build/css'))
)

gulp.task('clean', ->
    del(['./build/**'])
)

gulp.task('build', ['sass'])