Import-Module "C:\Admin\scripts\functions\write_log.ps1"
Import-Module "C:\Admin\scripts\functions\send_wol.ps1"

$result = Send-Wol -mac "1C697A0B211A"
WriteLog -Message "Accendi pc 1C697A0B211A $($result)"

