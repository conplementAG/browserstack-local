# Browserstack Local Docker
This repository contains a Dockerfile to create an image containing the _BrowserStackLocal_ executable and provides an additional Helm chart template for k8s cluster deployment.

# Overview
_BrowserStackLocal_ serves as a proxy tool to create a tunnel from any machine - which in most cases is either not public facing and/or behind a corporate firewall - to the Browserstack.com Hub and the attached Selenium Grid. Port 443 and websockets are used for communication.

# Docker Hub
Find the regarding docker image at:

    https://cloud.docker.com/u/binaryguy/repository/docker/binaryguy/browserstacklocaltesting

# Environment variables
Variable|Usage
-|-
BS_ACCESS_KEY| _Browserstack_ access token

# Run
Run it locally via the command:

    docker-compose up

# Helm Deployment
The deployment folder consists of a Helm chart template to deploy this image into a k8s cluster. 
To install the deployment execute the following command:

    helm upgrade --tiller-namespace tillernamespace --namespace namespace --install --wait browserstacklocal .\deployment\

Verify deployment using:

    helm list --tiller-namespace tillernamespace

# Verify tool running
Use _Browserstack_ API:

    https://www.browserstack.com/local/v1/list?auth_token=xxx&last=5&state=all