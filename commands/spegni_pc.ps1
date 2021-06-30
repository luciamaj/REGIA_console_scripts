Import-Module "C:\Admin\scripts\functions\write_log.ps1"

function Spegni-Pc {
	Param ([string] $Folder)
	$ips = Get-Content $Folder

	Foreach ($line in $lines) {
	   Write-Host ($line.Split(" "))[0]
	   $ip = ($line.Split(" "))[0]
	   
	   if(Test-Connection -ComputerName $ip -Count 2 -Quiet) {
	    Stop-Computer -ComputerName $ip
		$log = "Comando di spegnimento inviato"
	   } else {
		$log = "$($ip) seems to be offline"
	   }
	   
	   WriteLog -Message "Spegni pc $($ip): $($log)"
	   
	   [System.Threading.Thread]::Sleep([TimeSpan]::New(0, 0, 0, 0, 500))
	}
}