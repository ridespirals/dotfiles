#!/usr/bin/env bash

# most used commands
most_used=$(history 0 | awk '{col[$2]++} END {for (i in col) print col[i],i}' | sort -k1 -n | tail -n25 -r)

# most used git commands
git_commands=$(history 0 | awk '$2 == "git" {col[$3]++} END {for (i in col) print col[i],i}' | sort -k1 -n | tail -n25 -r)

echo "Most Used Commands"
echo "=================="
echo $most_used


echo ""
echo "Most Used Git Commands"
echo "======================"
echo $git_commands
