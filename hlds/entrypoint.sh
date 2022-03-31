#!/bin/bash
sleep 3
ulimit -c unlimited
cd /home/container
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}

if [ $? -ne 0 ]; then
    echo "CONTAINER_ERR: There was an error while attempting to run the start command."
    exit 1
fi
