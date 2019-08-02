try
{
	if ($args.Count -ne 1)
	{
		Write-Host "One argument is mandatory (Bamboo URL)"
	}
	else
	{
		if (-Not (Test-Path $Env:BAMBOO_INITIAL_CONFIG))
		{
			if (-Not (Test-Path $Env:BAMBOO_CAPABILITIES))
			{
				Copy-Item $Env:INIT_BAMBOO_CAPABILITIES -Destination $Env:BAMBOO_CAPABILITIES -Recurse -Force
			}
		}
		else
		{
			if (Test-Path $Env:BAMBOO_CAPABILITIES)
			{
				Remove-Item $Env:BAMBOO_CAPABILITIES
			}
		}
		
		refreshenv
		
		$aux = $args[0]

		java "-Dbamboo.agent.ignoreServerCertName=true" "-Djava.io.tmpdir=$Env:BAMBOO_TEMP" "-Dbamboo.home=$Env:BAMBOO_AGENT_HOME" "-Dbamboo.agent.home=$Env:BAMBOO_AGENT_HOME" -jar $Env:AGENT_JAR "$aux/agentServer/"
	}
}
catch [Exception] {
   Write-Host $_.Exception.Message;
   exit -1
}











