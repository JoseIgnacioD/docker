try {
	$toolsFolder = "$Env:TOOLS_FOLDER\programs"

	$WebClient = New-Object System.Net.WebClient

	Write-Host "Instalando MSBuild 15..." 
	$url = "http://download.visualstudio.microsoft.com/download/pr/d80c9e2f-b6f4-47cc-bc8b-1bb40ec4c92d/7189a68796aed20aabb13985c49d530b/vs_buildtools.exe"	
	$output = "$toolsFolder\vs_buildtools.exe"
	$WebClient.DownloadFile($url,$output)
	& $output --% --add Microsoft.Net.Component.4.TargetingPack --add Microsoft.Net.Component.3.5.DeveloperTools --add Microsoft.VisualStudio.Workload.WebBuildTools --add Microsoft.Net.Component.4.6.1.SDK --add Microsoft.Net.Component.4.7.SDK --add Microsoft.Net.Component.4.5.TargetingPack --add Microsoft.Net.Component.4.5.1.TargetingPack --add Microsoft.Net.Component.4.5.2.TargetingPack --add Microsoft.Net.Component.4.6.TargetingPack --add Microsoft.Net.Component.4.6.1.TargetingPack --add Microsoft.Net.Component.4.6.2.TargetingPack --add Microsoft.Net.Component.4.7.TargetingPack --add Microsoft.Net.Component.4.7.1.TargetingPack --add Microsoft.Net.Component.4.7.2.TargetingPack --norestart --quiet --wait | Out-Null
	Write-Host "MSBuild 15 instalado com sucesso." 
}
catch [Exception] {
   Write-Error $_.Exception.Message;
   exit -1
}