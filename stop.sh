#!/bin/bash

if [ $# -eq 1 ]
then
    echo -e 'Stopping' $1 'environment...\n'
else
    echo "No argument given - please provide environment name"
    exit
fi

source './env_'$1
'./prepEnv_'$1'.sh'



echo 'Stopping SM...'
docker-compose -f 'docker-compose_'$1'_sm.yaml' down --remove-orphans

echo 'Stopping SG...'
docker-compose -f 'docker-compose_'$1'_sg.yaml' down --remove-orphans

echo 'Stopping DA...'
docker-compose -f 'docker-compose_'$1'_da.yaml' down --remove-orphans

echo -e '\nChecking docker ps...\n '
docker ps | grep $1

#Check if any qce procs are running and kill them if so (the TP etc)
echo -e 'Check for running qce procs and kill...'

ps -ef | grep $1'/kdb-tick' | grep -v grep
kill -9 $(ps -ef | grep $1'/kdb-tick' | grep -v grep |  awk '{print $2}')

ps -ef | grep 'feedhandler' | grep -v grep
kill -9 $(ps -ef | grep 'feedhandler' | grep -v grep |  awk '{print $2}')

ps -ef | grep $1 | grep -v grep | grep -v stop.sh 
kill -9 $(ps -ef | grep $1 | grep -v grep | grep -v stop |  awk '{print $2}')
echo -e 'Running processes ('$1'): \n'

echo 'Done'
