Import-Module "C:\Admin\scripts\commands\spegni_onoff.ps1"
Import-Module "C:\Admin\scripts\commands\spegni_pc.ps1"
Import-Module "C:\Admin\scripts\commands\spegni_proiettore.ps1"
Import-Module "C:\Admin\scripts\commands\spegni_player.ps1"
$INI = Get-Content "C:\Admin\scripts\config.ini" | Select -Skip 1 | ConvertFrom-StringData

$sale = Get-Content "C:\Admin\scripts\lista_sale.txt"

Foreach ($sala in $sale) {
	$FolderPlayer = "C:\Admin\$($sala)\PLAYERlist.txt"
	if (Test-Path -Path $FolderPlayer) {
		"Player [$sala]"
		Spegni-Player -Folder $FolderPlayer
	} else {
		"Path $($FolderPlayer) doesn't exist."
	}
	
	$FolderPc = "C:\Admin\$($sala)\PClist.txt"
	if (Test-Path -Path $FolderPc) {
		"Pcs [$sala]"
		Spegni-Pc -Folder $FolderPc
	} else {
		"Path $($FolderPc) doesn't exist."
	}
	
	$FolderProiettore = "C:\Admin\$($sala)\PROJECTORlist.txt"
	if (Test-Path -Path $FolderProiettore) {
		"Proiettori [$sala]"
		Spegni-Proiettore -Folder $FolderProiettore
	} else {
		"Path $($FolderProiettore) doesn't exist."
	}
}

Start-Sleep -s $INI["SECONDS_BEFORE_SPEGNIMENTO"]

Foreach ($sala in $sale) {
	$FolderOnOff = "C:\Admin\$($sala)\ONOFFlist.txt"
	if (Test-Path -Path $FolderOnOff) {
		"On_Off [$sala]"
		Spegni-OnOff -Folder $FolderOnOff
	} else {
		"Path $($FolderOnOff) doesn't exist."
	}
}

$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")