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

1. Clone this repository
2. Initialise the submodule by running `git submodule init`
3. Checkout the source of the submodule into `src` with `git submodule update`

Alternatively you can also do all this in one step by passing `--recursive` to the initial `git clone`:

`git clone --recursive git@github.com:tsak/laravel-offline-documentation.git`

## Build

`$ ./build.sh`

Then open any HTML file in `dist`.

## To do

* Add documentation for switching branches in submodule
* Add documentation for updating submodule
* Integrate submodule handling in script
