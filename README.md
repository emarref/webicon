# Web Icon

Generate web icons such as favicon and touch icons with a shell script, then display the markup needed to use them in your HTML.

To use, simply execute the ```webicon.sh``` shell script from the command line, passing the filename of your source image as the only argument. The following images are generated in the current directory:

* favicon-310.png
* favicon-256.png
* favicon-152.png
* favicon-150.png
* favicon-144.png
* favicon-114.png
* favicon-120.png
* favicon-72.png
* favicon-70.png
* favicon-64.png
* favicon-57.png
* favicon-48.png
* favicon-32.png
* favicon-16.png
* favicon.ico

The original image remains untouched.

Tip: place this script somewhere in your system's $PATH for easy access.

## Requirements

* *nix environment
* [Image Magick](http://www.imagemagick.org/) for the ```convert``` command

## Credit

* Concept from [http://bergamini.org/computers/creating-favicon.ico-icon-files-with-imagemagick-convert.html](http://bergamini.org/computers/creating-favicon.ico-icon-files-with-imagemagick-convert.html)
* Input from [@pjkix](https://github.com/pjkix)
* Research by [@audreyr](https://github.com/audreyr) in the [favicon-cheat-sheet](https://github.com/audreyr/favicon-cheat-sheet) project
