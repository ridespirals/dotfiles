# get location of all keyframes in a video. pipe results into a file
# usage: script_name movie.mp4
# example: get-keyframes /path/to/movie.mp4 > movie-keyframes.txt
ffprobe -loglevel error -skip_frame nokey -select_streams v:0 -show_entries frame=pkt_pts_time -of csv=print_section=0 "$1"
