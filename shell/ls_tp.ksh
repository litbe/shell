#!/bin/ksh
#Indicate file fullpath and timestamp(old six month) 

if [ $# -ne 1 ]; then
    echo "message :Please set directory or filename" 1>&2
    echo "example :ls_tp.ksh /home/dir" 1>&2
    exit 1
fi

linefeed="
"
temp=$(ls -l --time-style=+'%Y/%m/%d %H:%M' $(find $1 -type f))
temp+=${linefeed}
find $1 -type d | while read line
do
    temp+=$(ls -dl --time-style=+'%Y/%m/%d %H:%M' $line)
    temp+=${linefeed}
done

echo "$temp" | sort -k8

