#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth




scp /tmp/.auth ec2-user@184.72.65.174:/tmp/
scp ./jenkins/deploy/publish ec2-user@184.72.65.174:/tmp/publish
ssh -o StrictHostKeyChecking=no ec2-user@184.72.65.174 "/tmp/publish"
