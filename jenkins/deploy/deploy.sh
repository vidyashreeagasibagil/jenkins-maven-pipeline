#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth




scp /tmp/.auth prod-user@192.168.43.247:/tmp/
scp ./jenkins/deploy/publish prod-user@192.168.43.247:/tmp/publish
ssh -o StrictHostKeyChecking=no prod-user@192.168.43.247 "/tmp/publish"
