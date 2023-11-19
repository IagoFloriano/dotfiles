#!/bin/bash

VOLUME="$(pamixer --get-volume)"
COLOR="$( [ $(pamixer --get-mute) = "true" ] && echo "#44475a" || echo "#bd93f9")"
BOX="<box type=Bottom width=2 mb=2 color="

echo "${BOX}${COLOR}><fc=${COLOR}>${VOLUME}</fc></box>"
