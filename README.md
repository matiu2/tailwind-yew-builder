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
 2. `docker-compose up dev` (This may take a while the first time, as it pulls the image from the docker hub)
    The output is in output/tailwind.css

## Production / release

You could probably include this in your build.rs - but I haven't tried it yet, but the manual run is:

 1. `cd tailwind-yew-builder`
 2. `docker-compose up prod` (This may take a while the first time, as it pulls the image from the docker hub, although it's the same image as `dev` so if you already ran dev, it should be quick)
    The output is in output/tailwind.css

It'll search through your yew app root:

 * src/**/*.rs
 * index.html

..and regex all the files, looking for things that match tailwind.css's class names. Anything it doesn't find, will not make it into the tailwind.css file. Also, with prod builds, the tailwind.css file is minified/cleaned.

# Using the output tailwind.css file

If you're using [trunk](https://github.com/thedodd/trunk) to build your yew app (which you should be), just include in your index.html:

    <link data-trunk rel="css" href="tailwind-yew-builder/output/tailwind.css"/>

# Advanced usage

## But my source isn't in ../ !

If your source is somewhere else, just tell it through the environment variable. Only it must start with a '.' or a '/' otherwise docker-compose will create an empty drive.

### Good

    SOURCE_CODE='./my_source' docker-compose up prod

### Bad

    SOURCE_CODE='my_source' docker-compose up prod

## Configuring tailwind

In `./input/` you'll see the tailwind configuration files:

 * `tailwind.css` - Configure that as shown [here](https://tailwindcss.com/docs/installation#using-a-custom-css-file)
 * `tailwind-config.js` - Configure that as shown [here](https://tailwindcss.com/docs/configuration)

# Super advanced

## Getting a later version of node/npm/tailwind..

If I've been lazy and haven't updated the docker hub image for a while, you can build your own by:

 1. If node.js was updated, in `Dockerfile` update the `wget` and `tar xf` commands to point to the later version
 2. In docker-compose.yaml under `image: matiu/tailwind-yew-builder` add this line:
    `build: .`
 3. `docker-compose build`

.. then carry on as normal.

## Make your own image

You can change the `image: matiu/tailwind-yew-builder` to your own docker-hub address, build it and run with it.
