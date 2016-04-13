#!/bin/bash
echo "--- By default this script decribe a topic in kafka 1 broker ---"
echo
echo "--- Enter y/n :"
read choice
if [ $choice == 'n' ]
then
        echo "--- Enter broker name from where your topic is stored ---"
        read kbroker
else
        echo "--- topic in kafka1 will be described ---"
        kbroker=kafka1
fi

echo " enter the topic name which you want to see in detail "
read topic


ansible $kbroker -i inventory  -a  "kafka_2.11-0.9.0.0/bin/kafka-topics.sh --describe --zookeeper {{ hostvars['zook1']['ansible_ssh_host'] }}:2181 --topic $topic"



