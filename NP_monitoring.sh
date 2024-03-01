#!/bin/bash
IPADDR="IPADDR"

`rm -rf /opt/npst/Scripts/503.txt`

tail -n5  /var/log/httpd/access_log | awk '{ if($9 == 503) { print $1 } }' > /opt/npst/Scripts/503.txt

count=`cat /opt/npst/Scripts/503.txt | wc -l`

if [ "$count" -ge "5" ]

then

IP=`cat /opt/npst/Scripts/503.txt |tail -n1 | awk '{print $1}'`
if [ "$IP" == "$IPADDR" ]
 then

curl -k "Please update your SMS getwayAPI URL"


else
   NPSTIP="IP address"
   if [ "$IP" == "$NPSTIP" ]
   then
curl -k "Please update your SMS getwayAPI URL"


#sleep 1800
   else 
   exit 0
   fi
fi

fi
