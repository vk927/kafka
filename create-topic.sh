#!/bin/bash
echo "--- By default this script creates topic in kafka 1 broker and repliacte it depending upon replication factor ---"
echo
echo "--- Enter y/n :"
read choice
if [ $choice == 'n' ]
then
	echo "--- Enter broker name where you wnat to create topic initially ---"
	read kbroker
else
	echo "--- topic will be created on kafka1 ---"
	kbroker=kafka1
fi
echo "--- Enter the name of topic ---"
read topic
echo "--- Enter the replication factor for the topic-(shouldn't be greater than number of brokers) ---"
read repfact
echo "--- Enter the number of partions for the topic ---"
read partion
ansible $kbroker  -a "kafka_2.11-0.9.0.0/bin/kafka-topics.sh --create --zookeeper {{ hostvars['zook1']['ansible_ssh_host'] }}:2181 --replication-factor $repfact  --partitions $partion --topic $topic"
