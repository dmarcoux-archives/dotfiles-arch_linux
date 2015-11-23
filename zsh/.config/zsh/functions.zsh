# Contains useful functions

# upup
# Quicker than cd ..; cd ...; etc...
#   ~$ cd ~/dir/example/folder
#   ~/dir/example/folder$ upup 2
#   ~/dir$
# Tips: Use with an alias like this: alias up='upup'
# Credits: http://www.bashoneliners.com/oneliners/oneliner/220/
upup(){ DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; }
