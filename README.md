# Tailwind builder

Released under the [MIT License](LICENSE.txt).

Builds [Tailwind CSS](https://tailwindcss.com/) using docker, especially for [yew](https://github.com/yewstack/yew) or other [rust](https://www.rust-lang.org/) and [wasm](https://webassembly.org/) style buildouts.

It expects your source files to be in `$SOURCE_CODE/src/**/*.rs` and `$SOURCE_CODE/index.html`.

# USAGE

In your brand new yew project:

 1. `git submodule add https://github.com/matiu2/tailwind-yew-builder.git`
 2. `git submodule init`
     You should now have a sub directory called tailwind-yew-builder 

## Manual run (dev builds)

You only need to run it once and it'll generate the latest file - then you just keep using it while developing

 1. `cd tailwind-yew-builder`
 2. `docker-compose build` ## This may take some time initially
 3. `docker-compose up dev`
    The output is in output/tailwind.css

## Using the file

If you're using [trunk](https://github.com/thedodd/trunk) to build your yew app (which you should be), just include in your index.html:

    <link data-trunk rel="css" href="tailwind-yew-builder/output/tailwind.css"/>


## Production / release

You could probably include this in your build.rs - but I haven't tried it yet, but the manual run is:

 1. `cd tailwind-yew-builder`
 2. `docker-compose build` ## This may take some time initially
 3. `docker-compose up prod`
    The output is in output/tailwind.css

It'll search through your yew app root:

 * src/**/*.rs
 * index.html

..and regex all the files, looking for things that match tailwind.css's class names. Anything it doesn't find, will not make it into the tailwind.css file. Also, with prod builds, the tailwind.css file is minified/cleaned.
