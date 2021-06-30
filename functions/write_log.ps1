function WriteLog {
	Param ([string] $Message)
	$date = Get-Date -Format "dd-MM-yyyy"
	$fullDateLog = Get-Date -Format "dd-MM-yyyy HH:mm:ss"
	Write-Output $Message
	$LogFolder = "C:\Admin\scripts\logs"
	if (Test-Path -Path $LogFolder -IsValid) {
		if (-not (Test-Path -Path $LogFolder)) {
			New-Item "$($LogFolder)\log_$($date).txt"
		}
		Add-Content "$($LogFolder)\log_$($date).txt" "$($fullDateLog) $($Message)"
	} else {
		Write-Output "Path $($LogFolder) is nor valid."
	}
}