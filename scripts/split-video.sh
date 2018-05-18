#!/bin/bash

# split section of video
# usage: script_name file_name start-time end-time
# example split_video my_video.mp4 22:28 45:25

# get length in seconds

# start=$(echo "$2" | awk -F: '{print (NV==3) ? (($1 * (60*60)) + ($2 * 60) + $3) : (($1 * 60) + $2)}')
# end=$(echo "$3" | awk -F: '{print (NV==3) ? (($1 * (60*60)) + ($2 * 60) + $3) : (($1 * 60) + $2)}')
# length=$(expr $end - $start)

# echo "Start: ${start} End: ${end}"
# echo "Calculated length: ${length}"

# get filename without extension
# fullname="$1"
# fname="${fullname%.*}"
#ffmpeg -i "${fname}.mp4" -c copy -t "$length"


# better version
# https://askubuntu.com/questions/56022/what-to-use-to-quickly-cut-audio-video
# usage: in_file start_time end_time out_file
# example movie.mp4 2300     4604     scene.mp4
# example movie.mp4 00:05:23 00:44:33 scene.mp4
ffmpeg -i "$1" -vcodec copy -acodec copy -ss $2 -t $3 $4
