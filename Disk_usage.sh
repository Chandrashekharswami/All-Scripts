#!/bin/sh
function passbyq() {
value1="${1}"
value2="${2}"
value3="${3}"

curl -k "SMSgetway URL put mobile number in that url"


}

 df -H | grep -vE '^Filesystem' | awk '{ print $5 " " $1 }' | while read output;
do
  per=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  part=$(echo $output | awk '{ print $2 }' )
  if [ $per -ge 60 ]; then
  TT="Disk_usage" 
   passbyq $per $part $TT
fi
done

