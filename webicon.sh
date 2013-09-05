#!/usr/bin/env bash

######################################
# INITIALIZE VARS

CONVERT_CMD=`which convert`
SRC_IMAGE=$1
PWD=`pwd`
TRANSPARENT_COLOUR="#FFFFFF"
IMAGE_NAME="favicon"
WEBSITE_DOMAIN="http://www.yourwebsite.com"

######################################
# COLOURS

GREY="\033[90m"
GREEN="\033[32m"
BLUE="\033[34m"
CYAN="\033[36m"
RED="\033[31m"
NO_COLOUR="\033[0m"

COLOUR_COMMENT=$GREY
COLOUR_TAG=$BLUE
COLOUR_ATTR_NAME=$CYAN
COLOUR_ATTR_VALUE=$RED
COLOUR_INTRO=$GREEN

######################################
# REQUIREMENTS

if [ -z $CONVERT_CMD ] || [ ! -f $CONVERT_CMD ] || [ ! -x $CONVERT_CMD ];
then
    echo "ImageMagick needs to be installed to run this script"
    exit;
fi

if [ -z $SRC_IMAGE ];
then
    echo "You must supply a source image as the argument to this command."
    exit;
fi

if [ ! -f $SRC_IMAGE ];
then
    echo "Source image \"$SRC_IMAGE\" does not exist."
    exit;
fi

function generate_png {
    local SIZE=$1
    local SOURCE=$2

    if [ -z "$SOURCE" ]; then
        SOURCE="$PWD/$IMAGE_NAME-256.png"
    fi

    if [ -z $SOURCE ];
    then
        echo "Could not find the source image $SOURCE"
        exit 1;
    fi

    echo "$IMAGE_NAME-${SIZE}.png"
    $CONVERT_CMD $SOURCE -resize ${SIZE}x${SIZE}! -transparent $TRANSPARENT_COLOUR $PWD/$IMAGE_NAME-${SIZE}.png
}

echo "Generating square base image"
# Converts the source image to 256 square, ignoring aspect ratio
generate_png 256 $SRC_IMAGE

######################################
# GENERATE THE VARIOUS SIZE VERSIONS

echo "Generating required versions at different sizes"
generate_png 16
generate_png 32
generate_png 48
generate_png 64
generate_png 57
generate_png 72
generate_png 114
generate_png 144
generate_png 152

######################################
# GENERATE THE FAVICON.ICO FILE

echo "Generating ico"
$CONVERT_CMD $PWD/$IMAGE_NAME-16.png $PWD/$IMAGE_NAME-32.png $PWD/$IMAGE_NAME-48.png $PWD/$IMAGE_NAME-64.png -colors 256 $PWD/$IMAGE_NAME.ico

######################################
# OUTPUT USEFUL MARKUP

echo
echo
echo -e "${COLOUR_COMMENT}_______________________________________________________________________________________${NO_COLOUR}"
echo
echo -e "${COLOUR_INTRO}Add the following tags to the head of your document. Remove any you don't want.${NO_COLOUR}"
echo -e "${COLOUR_INTRO}Compiled from https://github.com/audreyr/favicon-cheat-sheet${NO_COLOUR}"
echo
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"icon\"${COLOUR_ATTR_NAME} sizes=${COLOUR_ATTR_VALUE}\"16x16 32x32\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon.ico\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_COMMENT}<!--[if IE]><link rel=\"shortcut icon\" href=\"${WEBSITE_DOMAIN}/favicon.ico\"><![endif]-->${NO_COLOUR}"
echo
echo -e "${COLOUR_COMMENT}<!-- The below are optional but encouraged -->${NO_COLOUR}"
echo
echo -e "${COLOUR_COMMENT}<!-- Touch icon for iOS 2.0+ and Android 2.1+: -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"apple-touch-icon-precomposed\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-152.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo
echo -e "${COLOUR_COMMENT}<!-- The below are optional -->${NO_COLOUR}"
echo
echo -e "${COLOUR_COMMENT}<!-- IE 10 Metro tile icon (Metro equivalent of apple-touch-icon): -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<meta${COLOUR_ATTR_NAME} name=${COLOUR_ATTR_VALUE}\"msapplication-TileColor\"${COLOUR_ATTR_NAME} content=${COLOUR_ATTR_VALUE}\"$TRANSPARENT_COLOUR\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_TAG}<meta${COLOUR_ATTR_NAME} name=${COLOUR_ATTR_VALUE}\"msapplication-TileImage\"${COLOUR_ATTR_NAME} content=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-144.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_COMMENT}<!-- For iPad with high-resolution Retina display running iOS ≥ 7: -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"apple-touch-icon-precomposed\"${COLOUR_ATTR_NAME} sizes=${COLOUR_ATTR_VALUE}\"152x152\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-152.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_COMMENT}<!-- For iPad with high-resolution Retina display running iOS ≤ 6: -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"apple-touch-icon-precomposed\"${COLOUR_ATTR_NAME} sizes=${COLOUR_ATTR_VALUE}\"144x144\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-144.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_COMMENT}<!-- For iPhone with high-resolution Retina display running iOS ≥ 7: -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"apple-touch-icon-precomposed\"${COLOUR_ATTR_NAME} sizes=${COLOUR_ATTR_VALUE}\"120x120\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-120.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_COMMENT}<!-- For iPhone with high-resolution Retina display running iOS ≤ 6: -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"apple-touch-icon-precomposed\"${COLOUR_ATTR_NAME} sizes=${COLOUR_ATTR_VALUE}\"114x114\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-114.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_COMMENT}<!-- For first- and second-generation iPad: -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"apple-touch-icon-precomposed\"${COLOUR_ATTR_NAME} sizes=${COLOUR_ATTR_VALUE}\"72x72\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-72.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo -e "${COLOUR_COMMENT}<!-- For non-Retina iPhone, iPod Touch, and Android 2.1+ devices: -->${NO_COLOUR}"
echo -e "${COLOUR_TAG}<link${COLOUR_ATTR_NAME} rel=${COLOUR_ATTR_VALUE}\"apple-touch-icon-precomposed\"${COLOUR_ATTR_NAME} href=${COLOUR_ATTR_VALUE}\"${WEBSITE_DOMAIN}/favicon-57.png\"${COLOUR_TAG}>${NO_COLOUR}"
echo