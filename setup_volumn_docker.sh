#setup all
DOCKER_DATA_PATH="docker-data"
mkdir -p $DOCKER_DATA_PATH
chmod 700 $DOCKER_DATA_PATH

#setup nexus
DOCKER_NEXUS_PATH="nexus-data"
DOCKER_NEXUS_DATA_PATH="$DOCKER_DATA_PATH"/"$DOCKER_NEXUS_PATH"
mkdir -p $DOCKER_NEXUS_DATA_PATH
# usermod -a -G examplegroup exampleusername
chmod 777 -R $DOCKER_NEXUS_DATA_PATH
# sudo chown -R 200 $DOCKER_NEXUS_DATA_PATH # 200 because it's the UID of the nexus user inside the container