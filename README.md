# This repo setting all infrastructure to develop and deploy a Java project by docker

First of all, you need to install docker and docker-compose in your server

You need to run `./setup_volumn_docker` to setup volumn to map docker data and grant permission to user in docker

## 1. Install nexus 3: A remote maven repository
- Run nexus: `docker-compose up -d nexus`

You should change admin password
Then, go to MAVEN HOME (~/.m2/) create a settings.xml and copy the bellow to this file:

```
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                  http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <servers>
    <server>
      <id>nexus-snapshots</id>
      <username>admin</username>
      <password>admin_password</password>
    </server>
    <server>
      <id>nexus-releases</id>
      <username>admin</username>
      <password>admin_password</password>
    </server>
  </servers>
  
  <repositories>
    <repository>
        <id>nexus-releases</id>
        <name>maven-releases</name>
        <url>http://ip_addr/repository/maven-releases/</url>
    </repository>
</repositories>
</settings>
```

In your pom.xml file, add the following:
```
<distributionManagement>
    <repository>
        <id>nexus-releases</id>
        <name>maven-releases</name>
        <url>http://ip_addr/repository/maven-releases/</url>
    </repository>
    <snapshotRepository>
        <id>nexus-snapshots</id>
        <name>maven-snapshots</name>
        <url>http://ip_addr/repository/maven-snapshots/</url>
    </snapshotRepository>
</distributionManagement>
```