function Send-WOL
{
[CmdletBinding()]
param(
[Parameter(Mandatory=$True,Position=1)]
[string]$mac,
[string]$ip="255.255.255.255", 
[int]$port=4343
)
$broadcast = [Net.IPAddress]::Parse($ip)
 
$mac=(($mac.replace(":","")).replace("-","")).replace(".","")

$target=0,2,4,6,8,10 | % {[convert]::ToByte($mac.substring($_,2),16)}



$packet = (,[byte]255 * 6) + ($target * 16)

$UDPclient = new-Object System.Net.Sockets.UdpClient
$UDPclient.Connect($broadcast,$port)
[void]$UDPclient.Send($packet, 102) 
}