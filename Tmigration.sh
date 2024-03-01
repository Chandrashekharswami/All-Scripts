#/bin/sh
#Total Migration scripts
#********************************
#Auther : Chandrashekhar Swami
#********************************
skip_homedir()
{
mkdir /home/mig > /dev/null 2>&1
echo -e -n "\e[0;35m \t \t \t Are you sure to create skip homedir account ? [y/N] \e[0m "
read m1

        if [[ "$m1" =~ ^([yY][eE][sS]|[yY])+$ ]]
         then
        /scripts/pkgacct --skiphomedir $Tes1; mv /home/cpmove-$Tes1.tar.gz /home/mig/

              
                echo -e -n "\e[0;31m \t \t \t skip homedir account created successfully \n \e[0m "
        fi
sleep 1



echo -e -n "\e[0;35m \t \t \t Are you sure to migrate your account ? [y/N] \e[0m "
read response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
        then
                
                 echo -e -n "\e[1;31m \t \t \t Please enter destination server IP: \e[0m "
                 read ip3
                 echo -e -n "\e[1;31m \t \t \t Please enter destination server Port: \e[0m "
                 read port3

                if [[ -n "$ip3" && -n "$port3" ]]; then
                        echo -e "\t \t \t \e[0;33m Please hold on your account will migrate............\e[0m "

                        sleep 1
                        rsync -rpvlogDtH /home/mig/cpmove-$Tes1.tar.gz -e "ssh -p $port3" root@$ip3:/home/; ssh root@$ip3 -p$port3 -t "cd /home/;/scripts/restorepkg cpmove-$Tes1.tar.gz";rsync -rpvlogDtH /home/$Tes1 -e "ssh -p $port3" root@$ip3:/home/
                	echo -e "\t \t \t \e[1;36m Thank you for using this scripts.   \e[0m"
				exit 1;
                 else
                        echo -e -n "\t \t \t \e[0;33m Incorrect IP and port  \e[0m"
			read -p "Press [Enter] key to continue..." readEnterKe123y
                fi
	else
                exit 1; 
      fi
}
Receller()
{

echo -e -n "\e[0;35m \t \t \t Do you want to exclude any account from list ? [y/N] \e[0m "
read g2
if [[ "$g2" =~ ^([yY][eE][sS]|[yY])+$ ]]
        then
	    n=1
	    echo -e -n "\e[0;35m \t \t \t How many account do you want to exclude (* Number ): \e[0m "
	    read ft1
	    cd /home/Migration/  >/dev/null 2>&1
		while [ $n -le $ft1 ]
		do
			echo -e -n "\e[0;35m \t \t \t Enter Username name : \e[0m "
		        read  un1
       		        sed -i '/'"$un1"'/ d' Migration.txt
                         n=$(( n+1 ))
                done
fi

echo -e -n "\e[0;35m \t \t \t Are you sure to create PKG of reseller account ? [y/N] \e[0m "
read r1

        if [[ "$r1" =~ ^([yY][eE][sS]|[yY])+$ ]]
        then
		for i in `cat Migration.txt`;do /scripts/pkgacct $i; mv /home/cpmove-$i.tar.gz /home/Migration/;done
             echo -e -n "\e[0;31m \t \t \t Receller accounts PKG has been created successfully \n \e[0m "
       fi
	echo -e -n "\e[0;35m \t \t \t Are you sure to migrate Reseller  account ? [y/N] \e[0m "
	read response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
        then
                echo -e -n "\e[1;31m \t \t \t Please enter destination server IP: \e[0m "
                 read ip2
                 echo -e -n "\e[1;31m \t \t \t Please enter destination server Port: \e[0m "
                 read port2

                if [[ -n "$ip2" && -n "$port2" ]]; then

			ssh root@$ip2 -p$port2 -t "pgrep -fl RMig431r.sh"
			if [ $? -eq 0 ]; then echo -e -n "\e[1;31m \t \t \t Migration is running please wait \e[0m ";exit 1; else  echo -e  "\e[1;31m \t \t \t Migration process is not running on destion server  \e[0m "; fi

                        rsync -rpvlogDtH /home/Migration/* -e "ssh -p $port2" root@$ip2:/home/
		ssh root@$ip2 -p$port2 -t "cd /home/;echo 'for i in \`cat Migration.txt\`;do /scripts/restorepkg \$i;done' >/home/RMig431r.sh;chmod 755 /home/RMig431r.sh;sh /home/RMig431r.sh;rm -rf /home/RMig431r.sh"
			echo -e "\t \t \t \e[1;36m Thank you for using this scripts.   \e[0m"
			exit 1;
                        else
			echo -e -n "\t \t \t \e[0;33m Incorrect IP and port \e[0m"
			read -p "Press [Enter] key to continue..." readEnterKe123y
                fi

        else
                exit 1;
fi

}
pkgaccount()
{

mkdir /home/mig >/dev/null 2>&1

echo -e -n "\e[0;35m \t \t \t Are you sure to create PKG account ? [y/N] \e[0m "
read m1

        if [[ "$m1" =~ ^([yY][eE][sS]|[yY])+$ ]]
         then
	/scripts/pkgacct $t1; mv /home/cpmove-$t1.tar.gz /home/mig/

                echo -e -n "\e[0;31m \t \t \t PKG account created successfully \n \e[0m "
        fi
sleep 1


echo -e -n "\e[0;35m \t \t \t Are you sure to migrate your account ? [y/N] \e[0m "
read response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
        then
                 echo -e -n "\e[1;31m \t \t \t Please enter destination server IP: \e[0m "
                 read ip1
                 echo -e -n "\e[1;31m \t \t \t Please enter destination server Port: \e[0m "
		 read port1 
                
                if [[ -n "$ip1" && -n "$port1" ]]; then
			echo -e "\t \t \t \e[0;33m Please hold on your account will migrate............\e[0m "
                 
                 sleep 1
			rsync -rpvlogDtH /home/mig/cpmove-$t1.tar.gz -e "ssh -p $port1" root@$ip1:/home/; ssh root@$ip1 -p$port1 -t "cd /home/;/scripts/restorepkg cpmove-$t1.tar.gz"
		echo -e "\t \t \t \e[1;36m Thank you for using this scripts.   \e[0m"	
			exit 1;
			else
                        echo -e -n "\t \t \t \e[0;33m Incorrect IP and port  \e[0m"
			read -p "Press [Enter] key to continue..." readEnterKe123y
		fi

        else
                exit 1;
fi
}


while :
         do
clear
echo -e " \e[0;36m \t \t \t ***************\e[0m""\033[33;5;7mTotal Migration\033[0m""\e[0;36m***************\e[0m\n"
echo -e " \e[0;33m \t \t \t \t \t 1.Pkg account \e[0m  \n"
echo -e " \e[0;33m \t \t \t \t \t 2.Reseller account \e[0m  \n"
echo -e " \e[0;33m \t \t \t \t \t 3.Skip homedir  \e[0m  \n"
echo -e " \e[0;33m \t \t \t \t \t 4.exit \n"
echo -e " \e[0;36m \t \t \t *********************************************\e[0m \n  "
echo -e -n " \e[0;35m \t \t \t Please enter your choice 1...4  \e[0m \t : "
                read choice
	if [ -z $choice ] || [ $choice -gt 4 ]
        then
        echo -e -n "\e[1;31m \t \t \t Please enter correct choice [ 1 - 4 ] \e[0m "
           read -p "Press [Enter] key to continue..." readEnterKe123y
        else
               if [ "$choice" -eq 1 ];then
                        echo -e "\t \t \t \t \e[0;33m \t  Pkg account \e[0m"
                        echo -e -n "\e[1;31m \t \t \t Please enter domain name: \e[0m "
                        read dom1
			Dyu=`cat /etc/trueuserdomains |grep -w $dom1  2>&1`
                       if [ -z "$dom1" ] || [ -z "$Dyu" ]
                       then
			 echo -e -n "\e[1;31m \t \t \t Incorrect domain name \e[0m "
			 read -p "Press [Enter] key to continue..." readEnterKe123y
                       else
                        		    t1=`cat /etc/trueuserdomains |grep $dom1 |awk '{print $2}'`

                	  		    t2=`du -sh /home/$t1 |awk '{print $1}'`

			   		    echo -e " \e[0;36m \t \t \t *********************************************\e[0m \n  "
        		      		    echo -e "\e[0;33m \t \t \t Account Size of $dom1 ==>  $t2 \e[0m "
             		      		    echo -e "\e[1;31m \t \t \t Note :If Account size is less than 3 GB you can use Pkg account \e[0m "
       			                    echo -e "\e[1;31m \t \t \t Account size is Greater than 3 GB you can use Skip home dir \e[0m "
			                    echo -e " \e[0;36m \t \t \t *********************************************\e[0m \n  "
                                           pkgaccount
                         fi
		else
			if [ "$choice" -eq 2 ]; then
				echo -e "\t \t \t \t \e[0;33m \t  Receller Migration \e[0m"
				echo -e -n "\e[1;31m \t \t \t Please enter the Reseller domain name: \e[0m "
                                read dom2
				Dyu2=`cat /etc/trueuserdomains |grep -w $dom2  2>&1`
				if [ -z "$dom2" ] || [ -z "$Dyu2" ]
                                then
                                      echo -e -n  "\e[0;31m \t \t \t Incorrect domain name \e[0m "
			              read -p "Press [Enter] key to continue..." readEnterKe123y
                                else
				 tr1=`cat /etc/trueuserdomains |grep $dom2 |awk '{print $2}'`
				std=`cat /etc/trueuserowners |awk {'print $2'} |uniq -u |grep -w $tr1 2>&1`
				if [ -z "$std" ]; then
     				      echo -e -n  "\e[0;31m \t \t \t Incorrect Receller domain name \e[0m "
                                      read -p "Press [Enter] key to continue..." readEnterKe123y

				else
			

                                      mkdir /home/Migration  > /dev/null 2>&1

                                   #   cat /etc/trueuserowners |grep $tr1 | awk '{print $1}' | cut -d: -f 1 > Migration.txt;sed -i '/'"$tr1"'/ d' Migration.txt;sed -i '1s/^/'"$tr1"'\n/' Migration.txt
                                    cd /home/Migration/;cat /etc/trueuserowners |grep $tr1 | awk '{print $1}' | cut -d: -f 1 > Migration.txt;sed -i '/'"$tr1"'/ d' Migration.txt;sed -i '1s/^/'"$tr1"'\n/' Migration.txt
                                   echo -e " \e[0;36m \t \t \t *********************************************\e[0m \n  "

                                  for i in `cat Migration.txt`;do d1=`du -sh /home/$i | awk {'print $1'}`; echo -e "\e[0;33m \t \t \t Account Size of $i ==>  $d1 \e[0m ";done
                                   echo -e " \e[0;36m \t \t \t *********************************************\e[0m \n  "
                                     Receller
                             fi				
			fi
			else
				if [ "$choice" -eq 3 ]; then

					echo -e "\t \t \t \t \e[0;33m \t  skip homedir \e[0m"
		                        echo -e -n "\e[1;31m \t \t \t Please enter domain name: \e[0m "
                		        read dom3
                        		Dyu3=`cat /etc/trueuserdomains |grep -w $dom3  2>&1`
                       			if [ -z "$dom3" ] || [ -z "$Dyu3" ]
                     		        then
                       			   echo -e -n "\e[1;31m \t \t \t Incorect domain name \e[0m "
              			           read -p "Press [Enter] key to continue..." readEnterKe123y
		                        else
                        
                              
                                            Tes1=`cat /etc/trueuserdomains |grep $dom3 |awk '{print $2}'`

                                            Tes2=`du -sh /home/$Tes1 |awk '{print $1}'`

                                            echo -e " \e[0;36m \t \t \t *********************************************\e[0m \n  "
                                            echo -e "\e[0;33m \t \t \t Account Size of $dom3 ==>  $Tes2 \e[0m "
                                            echo -e " \e[0;36m \t \t \t *********************************************\e[0m \n  "
                                           skip_homedir
                           
                       		       fi
				else
                                      exit 1;
				fi
			fi
		fi
           fi
done

