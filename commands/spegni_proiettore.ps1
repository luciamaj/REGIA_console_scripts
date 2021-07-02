Import-Module "C:\Admin\scripts\functions\write_log.ps1"
$INI = Get-Content "C:\Admin\scripts\config.ini" | Select -Skip 1 | ConvertFrom-StringData

function Spegni-Proiettore {
	Param ([string] $Folder)
	$lines = Get-Content $Folder

	Foreach ($line in $lines) {
	   Write-Host ($line.Split(" "))[0]
	   $ip = ($line.Split(" "))[0]
	   if(Test-Connection -ComputerName $ip -Count 2 -Quiet) {
		$log = C:\Admin\scripts\bin\pjlink-cli.exe $ip "POWR 0" $INI["PJLINK_PASSWORD"]
	   } else {
		$log = "$($ip) seems to be offline"
	   }
	   
	   WriteLog -Message "Spegni proiettore $($ip): $($log)"
	   [System.Threading.Thread]::Sleep([TimeSpan]::New(0, 0, 0, 1, 0))
	}
}