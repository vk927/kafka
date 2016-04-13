#!/bin/bash
echo "--- By default this script lists topics in kafka 1 broker ---"
echo
echo "--- Enter y/n :"
read choice
if [ $choice == 'n' ]
then
        echo "--- Enter broker,whoose topics you want to see  ---"
        read kbroker 
else
        echo "--- topics in kafka1 will be listed  ---"
        kbroker=kafka1
fi
 
ansible $kbroker -i inventory -a "~/kafka_2.11-0.9.0.0/bin/kafka-topics.sh --list --zookeeper {{ hostvars['zook1']['ansible_ssh_host'] }}:2181 "
