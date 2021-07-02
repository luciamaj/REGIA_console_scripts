Import-Module "C:\Admin\scripts\commands\accendi_onoff.ps1"
Import-Module "C:\Admin\scripts\commands\accendi_pc.ps1"
Import-Module "C:\Admin\scripts\commands\accendi_proiettore.ps1"
Import-Module "C:\Admin\scripts\commands\accendi_player.ps1"
$INI = Get-Content "C:\Admin\scripts\config.ini" | Select -Skip 1 | ConvertFrom-StringData

$sale = Get-Content "C:\Admin\scripts\lista_sale.txt"

Foreach ($sala in $sale) {
	$FolderOnOff = "C:\Admin\$($sala)\ONOFFlist.txt"
	if (Test-Path -Path $FolderOnOff) {
		"On_Off [$sala]"
		Accendi-OnOff -Folder $FolderOnOff
	} else {
		"Path $($FolderOnOff) doesn't exist."
	}
}

Start-Sleep -s $INI["SECONDS_AFTER_ACCENSIONE"]

Foreach ($sala in $sale) {
	$FolderProiettore = "C:\Admin\$($sala)\PROJECTORlist.txt"
	if (Test-Path -Path $FolderProiettore) {
		"Proiettori [$sala]"
		Accendi-Proiettore -Folder $FolderProiettore
	} else {
		"Path $($FolderProiettore) doesn't exist."
	}

	$FolderPc = "C:\Admin\$($sala)\PClist.txt"
	if (Test-Path -Path $FolderPc) {
		"Pcs [$sala]"
		Accendi-Pc -Folder $FolderPc
	} else {
		"Path $($FolderPc) doesn't exist."
	}

	$FolderPlayer = "C:\Admin\$($sala)\PLAYERlist.txt"
	if (Test-Path -Path $FolderPlayer) {
		"Player [$sala]"
		Accendi-Player -Folder $FolderPlayer
	} else {
		"Path $($FolderPlayer) doesn't exist."
	}		
}

$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")