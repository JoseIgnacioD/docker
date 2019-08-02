FROM mcr.microsoft.com/windows/servercore:1607-amd64
MAINTAINER Jose Ignacio Durand

ENV BAMBOO_VERSION=6.7.1
ENV DOWNLOAD_URL=https://packages.atlassian.com/maven-closedsource-local/com/atlassian/bamboo/atlassian-bamboo-agent-installer/$BAMBOO_VERSION/atlassian-bamboo-agent-installer-$BAMBOO_VERSION.jar
ENV BAMBOO_USER_HOME=C:\\bamboo
ENV BAMBOO_AGENT_HOME=$BAMBOO_USER_HOME\\home
ENV AGENT_JAR=$BAMBOO_USER_HOME\\atlassian-bamboo-agent-installer.jar
ENV SCRIPT_WRAPPER=$BAMBOO_USER_HOME\\runAgent.ps1
ENV INIT_BAMBOO_CAPABILITIES=$BAMBOO_USER_HOME\\init-bamboo-capabilities.properties
ENV BAMBOO_CAPABILITIES=$BAMBOO_AGENT_HOME\\bin\\bamboo-capabilities.properties
ENV BAMBOO_INITIAL_CONFIG=$BAMBOO_AGENT_HOME\\bamboo-agent.cfg.xml
ENV BAMBOO_TEMP=$BAMBOO_USER_HOME\\temp


#Override the default shell used for Docker in Windows
SHELL ["powershell", "-Command"]

RUN New-Item -ItemType directory -Path $Env:BAMBOO_USER_HOME

#Override the action to take in response to a non-terminanting error occurring, to STOP. 
RUN $ErrorActionPreference = 'Stop'

#Install chocolatey (https://chocolatey.org/docs/installation)
RUN if ((Get-ExecutionPolicy) -eq 'Restricted') { Set-ExecutionPolicy -ExecutionPolicy AllSigned -Force }

RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

RUN choco install jdk8 -version 8.0.211 -y

ADD $DOWNLOAD_URL "$AGENT_JAR"

COPY bamboo-update-capability.ps1 $BAMBOO_USER_HOME\\bamboo-update-capability.ps1

COPY runAgent.ps1 $SCRIPT_WRAPPER

RUN mkdir -p $Env:BAMBOO_AGENT_HOME\bin

RUN mkdir -p $Env:BAMBOO_TEMP

WORKDIR $BAMBOO_USER_HOME

RUN .\bamboo-update-capability.ps1 'system.jdk.JDK 1.8' 'C:\\Program Files\\Java\\jdk1.8.0_191\\'

ENTRYPOINT .\runAgent.ps1