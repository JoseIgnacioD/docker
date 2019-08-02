try
{
	if ($args.Count -ne 2)
	{
		Write-Host "Two arguments are mandatory (Key & value)"
	}
	else
	{
		#Create file if not exists.
		if (-Not (Test-Path $Env:INIT_BAMBOO_CAPABILITIES))
		{
			New-Item $Env:INIT_BAMBOO_CAPABILITIES -ItemType file
		}
		
		$capability_key = $args[0]
		$capability_value = $args[1]
		
		#remove previous values of this key
		$propertiesFilePath = $Env:INIT_BAMBOO_CAPABILITIES
		$temporalFilePath = "$Env:BAMBOO_USER_HOME\temporalFile.txt"
		
		New-Item $temporalFilePath -ItemType file -Force
		
		Get-Content $propertiesFilePath | where {$_ -notmatch "^$([regex]::Escape($capability_key)).*$" } | Set-Content $temporalFilePath
		Get-Content $temporalFilePath | Set-Content $propertiesFilePath
		
		Remove-Item -Path $temporalFilePath -Force

		#add new value of this key
		$property = $capability_key + "=" + $capability_value
		Add-Content $propertiesFilePath $property
	}
	
}
catch [Exception] {
   Write-Host $_.Exception.Message;
   exit -1
}