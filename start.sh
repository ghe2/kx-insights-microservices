#!/bin/bash

if [ $# -eq 1 ]
then
    echo -e 'Starting' $1 'environment...\n'
else
    echo "No argument given - please provide environment name"
    exit
fi


#Create the db directory
#sudo su -
#rm -rf db

#if [[ -d $mnt_dir ]]
#then
#    echo "ERROR: db directory already exists - delete as root user and run start.sh again"
#    exit
#fi

echo -e 'Running source ./env...\n'
source ./env.local
source './env_'$1

#Run prepEnv and source each time just in case it's the first run of the day or something has been changed
echo -e 'Running prepEnv...\n'
'./prepEnv_'$1'.sh'

echo "Making and permissioning the db"
mkdir -p $mnt_dir
chmod o+rw $mnt_dir

echo -e 'Check for running qce procs and kill\n'
kill -9 $(ps -ef | grep $1'/kdb-tick' | grep -v grep |  awk '{print $2}')

echo -e 'Starting TP on port '${NODES_PORT}'...\n'
#Navigate into kdb-tick directory to start the TP
cd ./kdb-tick/
q tick.q $1 /data/tplogs -p ${NODES_PORT} -env $1 &

#Move back to directory with the docker-compose files
cd ../

#Start the procs
docker-compose -f 'docker-compose_'$1'_sm.yaml' up -d
docker-compose -f 'docker-compose_'$1'_sg.yaml' up -d
docker-compose -f 'docker-compose_'$1'_da.yaml' up -d

sleep 3

cd kdb-tick
#q feedhandler_ETH.q -env $1 &
#q feedhandler_ETH.q -p 6003 -env $1 >> alchemy.log 2>&1 &
#q feedhandler_allLevels.q -env $1 &
q feedhandler_allExchanges.q -p 6001 -env $1 >> allExchanges.log 2>&1 &
## Start the CTP GW for processes to query and subscribe to
q ctp_gw.q crypto localhost:5010 -p 6005 -env crypto &

sleep 3

echo -e '\nRunning processes: \n'
docker ps | grep $1'_'
ps aux | grep $1

cd ../

q gateway.q -p 40002 -u 1 &
