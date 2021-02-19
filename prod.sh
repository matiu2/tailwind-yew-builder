#!/bin/sh
echo "Building tailwind.big.css"
npx tailwindcss-cli@latest build /work/input/tailwind.css --minify --purge -c /work/input/tailwind.config.js -o /work/output/tailwind.big.css

echo "Removing old output/tailwind.css"
rm /work/output/tailwind.css

echo "Shrinking..."
cleancss /work/output/tailwind.big.css -o /work/output/tailwind.css

echo "Removing output/tailwind.big.css"
rm /work/output/tailwind.big.css

