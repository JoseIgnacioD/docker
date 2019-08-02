A Bamboo Agent is a service that can run job builds. Each agent has a defined set of capabilities and can run builds only for jobs whose requirements match the agent's capabilities.
To learn more about Bamboo, see: https://www.atlassian.com/software/bamboo

If you are looking for **Bamboo Server Docker Image** it can be found [here](https://hub.docker.com/r/atlassian/bamboo-server/).

# Overview

This Docker image makes it easy to get an instance of Bamboo Agent up and running in Windows. This minimal image is suitable for customisation and contains only Bamboo Agent, Chocolatey and OpenJDK 8.

Note that Bamboo Agent Docker Image does not include a Bamboo server.

This image was created based in the Bamboo agent for Linux by Atlassian (https://hub.docker.com/r/atlassian/bamboo-agent-base)

# Quick Start

For the agent’s home directory which is used for storing agent’s configuration and builds data, we strongly recommend mounting a host directory as a data volume or a named volume:
	
	docker volume create --name bambooAgentVolume
	
Make sure your Bamboo server is running and has remote agents support enabled. To enable it:

1. Go to **Administration > Agents**.
2. Start the Bamboo Agent container:

		docker run -v bambooAgentVolume:/home/bamboo/bamboo-agent-home --name="bambooAgent" --init -d "imageID" BAMBOO_SERVER_URL

	where `BAMBOO_SERVER_URL` is the base URL of your Bamboo server. Note that the `--init` flag is required to properly reap zombie processes.
	
3. Verify if your remote agent has registered itself. Go back to the **Administration > Agents**.

### Security token

If you have security token verification enabled on your server, you can pass the token to the agent via the `SECURITY_TOKEN` environment variable in the docker run command.


# Extending base image

This Docker image contains only minimal setup to run a Bamboo agent which might not be sufficient to run your builds. If you need additional capabilities you can extend the image to suit your needs.


# Upgrade

Remote agents are updated automatically, so you don’t need to worry about it during Bamboo server upgrade. Agents automatically detect when a new version is available and downloads new classes from the server.