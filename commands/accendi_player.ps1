Import-Module "C:\Admin\scripts\functions\send_udp.ps1"
Import-Module "C:\Admin\scripts\functions\write_log.ps1"

function Accendi-Player {
	Param ([string] $Folder)
	$lines = Get-Content $Folder

	Foreach ($line in $lines) {
	   Write-Host ($line.Split(" "))[0]
	   $ip = ($line.Split(" "))[0]
	   
	   if(Test-Connection -ComputerName $ip -Count 2 -Quiet) {
	   	Send-UdpDatagram -EndPoint $ip -Port 5000 -Message "pwrSaveDisable"
		$log = "UDP inviato"
	   } else {
		$log = "$($ip) seems to be offline"
	   }
	   
	   WriteLog -Message "Accendi player $($ip): $($log)"
	   [System.Threading.Thread]::Sleep([TimeSpan]::New(0, 0, 0, 0, 500))
	}
}