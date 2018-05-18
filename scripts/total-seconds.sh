#!/bin/bash

# convert time in 00:00:00 format to total seconds
# example: total-seconds 00:05:00 => 300
function convert_time() {
    echo $(echo "$1" | awk -F: '{print (NF==3) ? (($1 * (60*60)) + ($2 * 60) + $3) : (($1 * 60) + $2)}')
}

echo $(convert_time $1)
