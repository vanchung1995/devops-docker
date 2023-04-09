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


# setup jenkins
wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvzf apache-maven-3.6.3-bin.tar.gz
wget https://builds.openlogic.com/downloadJDK/openlogic-openjdk/8u362-b09/openlogic-openjdk-8u362-b09-linux-x64.tar.gz

# install gitlab plugin in manager plugin
# in jenkins, go to user configuration, create a new api token
# in gitlab, go to setting -> webhook, modify url: http://<jenkins_user>:<api_token>@<jenkins_ip>/project/<jenkin_project_name>/
# trigger push event

# in gitlab, go to setting -> repository -> deploy tokens
# go to jenkins in configure, in pipeline, select add jenkins credentials, select user and password, patse from gitlab above to this