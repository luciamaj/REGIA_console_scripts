Import-Module "C:\Admin\scripts\functions\write_log.ps1"
Import-Module "C:\Admin\scripts\functions\send_wol.ps1"

function Accendi-Pc {
	Param ([string] $Folder)
	$lines = Get-Content $Folder

	Foreach ($line in $lines) {
	   Write-Host ($line.Split(" "))[1]
	   $mac = ($line.Split(" "))[1]
	   Send-Wol -mac $mac
	   WriteLog -Message "Accendi pc $($mac)"
	   [System.Threading.Thread]::Sleep([TimeSpan]::New(0, 0, 0, 1, 0))
	}
}