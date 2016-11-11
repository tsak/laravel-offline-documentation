# Laravel offline documentation

Simple bash script to build an offline version of the Laravel documentation.
Uses [Pandoc](http://pandoc.org/) to render the Laravel documentation's Markdown as HTML.
Laravel documentation integrated as git submodule.

## Prerequisites

* Unix/Linux
* Pandoc - [pandoc.org](http://pandoc.org/)
* Bash
* Git

## Install



## Build

`$ ./build.sh`

Then open any HTML file in `dist`.

## To do

* Add documentation for switching branches in submodule
* Add documentation for updating submodule
* Integrate submodule handling in script
