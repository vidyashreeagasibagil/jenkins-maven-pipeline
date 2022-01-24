#!/bin/bash

echo "*******************"
echo "*****Testing the code**"
echo "*******************"

WORKSPACE=/home/vidya/jenkins/jenkins_home/workspace/maven-jenkins-pipeline

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app  maven:3.8.2-ibmjava-alpine mvn test
