#!/bin/bash


Tomcat=/opt/npst/tomcat
upiserver=/opt/npst/upi/upiserver
middleware=/opt/npst/upi/middleware
upiserver_name=upiserver.jar
middleware_name=Middleware-0.0.1-SNAPSHOT.jar
screen_name_of_middleware=middleware
screen_name_of_upiserver=upiserver

########Shutdown tomcat ##############

cd $Tomcat/bin/
./shutdown.sh

sleep 2
ps -ef | grep java | grep $Tomcat/bin > /dev/null

if [ "$?" -eq "0" ]
then
 pid_of_tomcat=`ps -ef | grep java | grep $Tomcat/bin | awk '{print $2}'`
 
 kill -9 $pid_of_tomcat 2> /dev/null
fi

##########Wait for 2min######################

sleep 60

###########Stop the upiserver################

pid_of_upiserver=`ps -ef | grep java | grep $upiserver_name | awk '{print $2}'`
 #Kill the process if running
     kill -9 $pid_of_upiserver 2> /dev/null >/dev/null
        sleep 1
        Wipe=`screen -ls | grep $screen_name_of_upiserver | awk '{print $1}'`
        screen -wipe $Wipe > /dev/null 2> /dev/null
	sleep 2
 	screen -X -S $Wipe kill > /dev/null 2>/dev/null

sleep 60

############ Restart the Middleware##############

 pid_of_MiddleWare=`ps -ef | grep java | grep $middleware_name | awk '{print $2}'`
#Kill the process if running and restart the service
     kill -9 $pid_of_MiddleWare 2> /dev/null >/dev/null
        sleep 1
        Wipe=`screen -ls | grep $screen_name_of_middleware | awk '{print $1}'`
	screen -wipe $Wipe > /dev/null 2> /dev/null
	sleep 2
        screen -X -S $Wipe kill > /dev/null 2>/dev/null
		
		sleep 10
		
  cd $middleware

  screen -A -m -d -S $screen_name_of_middleware java -jar $middleware_name

  sleep 10
  
##############Start The upiserver##############

cd $upiserver

  screen -A -m -d -S $screen_name_of_upiserver java -jar $upiserver_name

############Start the tomcat#####################
sleep 10

cd $Tomcat/bin/
./startup.sh
