module.exports = {
    plugins: [
        require('tailwindcss'),
        process.env.NODE_ENV === 'production' ? require('autoprefixer') : null,
        process.env.NODE_ENV === 'production' ? require('cssnano')({ preset: 'default' }) : null,
        process.env.NODE_ENV === 'production' ? require('@fullhuman/postcss-purgecss')({
            content: ["./source_code/src/**/*.rs", "./source_code/index.html"],
            defaultExtrator: content => content.match(/[A-Za-z0-9-_:/]+/g) || []
        }) : null
    ]
}
