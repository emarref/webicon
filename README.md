# Web Icon

Generate favicon and touch icons via a shell script.

To use, simply execute the ```webicon.sh``` shell script from the command line, passing the filename of your source image as the only argument. The following copies of the source image are generated in the current directory:

* apple-touch-icon-144x144-precomposed.png
* apple-touch-icon-114x114-precomposed.png
* apple-touch-icon-57x57-precomposed.png
* apple-touch-icon-72x72-precomposed.png
* apple-touch-icon-precomposed.png
* apple-touch-icon.png
* favicon.ico

The original image remains untouched.

Tip: place this script somewhere in your system's $PATH for easy access.

## Requirements

* *nix environment
* [Image Magick](http://www.imagemagick.org/)

## Credit

Concept from [http://bergamini.org/computers/creating-favicon.ico-icon-files-with-imagemagick-convert.html](http://bergamini.org/computers/creating-favicon.ico-icon-files-with-imagemagick-convert.html)

Input from @pjkix
