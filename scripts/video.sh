#!/bin/zsh

convert() {
    echo ":e -> ${1:e}"
    echo ":t -> ${1:t}"
    echo ":r -> ${1:r}"
    echo ":h -> ${1:h}"
    echo ":h:h -> ${1:h:h}"
    echo ":t:r -> ${1:t:r}"

    ffmpeg -i "$1" -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" "${1:r}.mp4"
}
convert $1
