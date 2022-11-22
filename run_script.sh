#!/bin/bash
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 623158369342.dkr.ecr.ap-south-1.amazonaws.com && docker pull 623158369342.dkr.ecr.ap-south-1.amazonaws.com/java-web-application:${buildnumber}
