FROM "YOUR_REPO"/"base_agent_image"

#Install all packages needed for the agents
RUN choco install -y git

RUN choco install sonarscanner-msbuild-net46 -version 4.6.2.2108 -y

RUN choco install nuget.commandline -version 5.2.0 -y

RUN choco install maven -version 3.6.1.20190711 -y

RUN choco install xunit -version 2.3.1 -y

RUN choco install python2 --version 2.7.16 -y

RUN choco install yarn --version 1.17.3 -y

RUN choco install unzip --version 6.0 -y

RUN choco install zip --version 3.0 -y

RUN choco install reportviewer2012 --version 11.0.3452.0 -y

RUN choco install dotnetcore-sdk --version 2.2.401 -y

RUN choco install dotcover-cli --version 2019.1 -y

RUN choco install nodejs --version 12.7.0 -y

ENV TOOLS_FOLDER=c:\\tools
ENV SCRIPTS_FOLDER=$TOOLS_FOLDER\\powershellScripts

#Copy and execute all powershell scripts
WORKDIR $SCRIPTS_FOLDER

COPY install_msbuild.ps1 $SCRIPTS_FOLDER\\install_msbuild.ps1
RUN .\install_msbuild.ps1

RUN refreshenv

WORKDIR $BAMBOO_USER_HOME

RUN .\bamboo-update-capability.ps1 'OS' 'Windows'
RUN .\bamboo-update-capability.ps1 'system.jdk.JDK\ 1.8.0_211' 'C:\\Program Files\\Java\\jdk1.8.0_211\\'
RUN .\bamboo-update-capability.ps1 'system.git.executable' 'C:\\Program Files\\Git\\cmd\git.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.mvn3.Maven\ (v3.6.1)' "$Env:chocolateyInstall\\lib\\maven\\apache-maven-3.6.1"
RUN .\bamboo-update-capability.ps1 'system.builder.node.NodeJs' 'C:\\Program Files\\nodejs\\node.exe'

RUN .\bamboo-update-capability.ps1 'system.builder.Command.AspNetCompiler\ (32bit)' 'C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\aspnet_compiler.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.AspNetCompiler\ (64bit)' 'C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319\\aspnet_compiler.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Aspnet_regiis\ (32bit)' 'C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\aspnet_regiis.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Aspnet_regiis\ (64bit)' 'C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319\\aspnet_regiis.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.CMD' 'C:\\Windows\\System32\\cmd.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.DotCover' "$Env:chocolateyInstall\\lib\\dotcover-cli\\content\\dotcover.exe"
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Dotnet' 'C:\\Program Files\\dotnet\\dotnet.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Lc' 'C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.6.1 Tools\\Lc.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Nuget\ (v5.2.0)' "$Env:chocolateyInstall\\lib\\NuGet.CommandLine\\tools\\nuget.exe"
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Robocopy' 'C:\\Windows\\System32\\Robocopy.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Unzip' "$Env:chocolateyInstall\\lib\\unzip\\tools\\unzip.exe"
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Versioner' "$Env:chocolateyInstall\\lib\\Versioner\\Versioner.exe"
RUN .\bamboo-update-capability.ps1 'system.builder.Command.XUnit\ (v2.3.1)' "$Env:chocolateyInstall\\lib\\XUnit\\tools\\xunit.console.exe"
RUN .\bamboo-update-capability.ps1 'system.builder.Command.Yarn\ (v1.17.3)' 'C:\\Program Files (x86)\\Yarn\\bin\\Yarn.cmd'
RUN .\bamboo-update-capability.ps1 'system.builder.Command.ZIP' "$Env:chocolateyInstall\\lib\\zip\\tools\\zip.exe"

RUN .\bamboo-update-capability.ps1 'system.builder.MSBuild.MSBuild\ v12.0\ (32bit)' 'C:\\Program Files (x86)\\MSBuild\\12.0\\bin\\Msbuild.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.MSBuild.MSBuild\ v12.0\ (64bit)' 'C:\\Program Files (x86)\\MSBuild\\12.0\\bin\\amd64\\Msbuild.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.MSBuild.MSBuild\ v14.0\ (32bit)' 'C:\\Program Files (x86)\\MSBuild\\14.0\\bin\\Msbuild.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.MSBuild.MSBuild\ v14.0\ (64bit)' 'C:\\Program Files (x86)\\MSBuild\\14.0\\bin\\amd64\\Msbuild.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.MSBuild.MSBuild\ v15.0\ (32bit)' 'C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\MSBuild\\15.0\\Bin\\Msbuild.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.MSBuild.MSBuild\ v15.0\ (64bit)' 'C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools\\MSBuild\\15.0\\Bin\\amd64\\Msbuild.exe'
RUN .\bamboo-update-capability.ps1 'system.builder.MSBuild.MSBuild Sonar Scanner\ (v4.6.2)' "$Env:chocolateyInstall\\lib\\sonarscanner-msbuild-net46\\tools"