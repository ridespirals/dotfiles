# get the output json from kibana using the query:
#    _exists_: FileType AND FileType: ANY
# save that json somewhere, then cat it into this:
ag Filename | awk -F ':' '{print $2}' | sed 's/\"//g' | sed 's/,$//g' | sed 's/^.*\.//' | sort | uniq
# you should have a list of all the unique file extensions from the list

# TODO: extract this into a callable script or function or something
