#!/usr/bin/env bash

SRC=./src
ASSETS=./assets
DIST=./dist
TEMPLATES=./templates
BEFORE_TEMPLATE="$TEMPLATES/before.html" # Will be generated by the script
AFTER_TEMPLATE="$TEMPLATES/after.html"
HEADER_TEMPLATE="$TEMPLATES/header.html"

# Clear dist folder
if [ -d "$DIST" ]; then
  rm -Rf "$DIST"
fi

mkdir "$DIST"

cd "$SRC"

# Determine Laravel version

LARAVEL_VERSION=`git rev-parse --abbrev-ref HEAD`
echo "Generating offline documentation for Laravel $LARAVEL_VERSION"

# Generate the before (navigation) template
echo "<aside><h1>Laravel $LARAVEL_VERSION offline docs</h1><ul id=\"navigation\">" > "../$BEFORE_TEMPLATE"

for file in *.md ; do

  name=${file%.*}
  outfile=$name.html
  firstline=$(head -n 1 "$file")
  title=${firstline:2}

  if [ -n "$title" -a "$name" != "license" ]
  then
    echo "<li><a href=\"$outfile\">$title</a>" >> "../$BEFORE_TEMPLATE"
  fi

done

echo "</ul></aside><article>" >> "../$BEFORE_TEMPLATE"

# Build docs
for file in *.md ; do

  name=${file%.*}
  outfile="../$DIST/$name.html"
  firstline=$(head -n 1 "$file")
  title=${firstline:2}

  if [ -n "$title" -a "$name" != "license" ]
  then

    echo "Processing $title"

    pandoc --standalone --from=markdown_github --to=html5 --title-prefix="$title" \
    --css=github-pandoc.css --include-before-body="../$BEFORE_TEMPLATE" \
    --include-after-body="../$AFTER_TEMPLATE" --include-in-header="../$HEADER_TEMPLATE" \
    --output="$outfile" "$file"

  fi

done

cd ..

# Copy assets
cp "$ASSETS/github-pandoc.css" "$ASSETS/site.js" "$DIST/"