# Looks for Chrome
if (($null -eq (Get-Command "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -ErrorAction SilentlyContinue)) -and ($null -eq (Get-Command "C:\Program Files\Google\Chrome\Application\chrome.exe" -ErrorAction SilentlyContinue)))   {
	Write-Output "Launching Chrome Installer...`n"
	./ChromeSetup.exe
}

# Looks for VLC
if ($null -eq (Get-Command "C:\Program Files\VideoLAN\VLC\vlc.exe" -ErrorAction SilentlyContinue))   {
	Write-Output "Launching VLC Installer...`n"
	./vlc-3.0.11-win64.exe
}

# Checks to see if Duo has been installed
if ( -Not (Test-Path -Path "C:\Program Files\Duo Security"))	{
	Write-Output "! - The latest windows update should install Duo automatically, but you can manually install it now if you wish to."
	$ANS = Read-Host "Would you like to install Duo now? (y/n): "
	if ($ANS -eq "y") {
		Write-Output "Launching the Duo installer and keys.txt...`n"
		./duo-win-login-4.2.0.exe
		./keys.txt
	}
	else {
		Write-Output "Skipping Duo Installer...`n"
	}

}

# Looks for JRE & Doceri
if ( -Not (Test-Path -Path "C:\Program Files (x86)\Java"))	{
	Write-Output "Which programs would you like to install?"
	$ANS = Read-Host "(1 - JRE & Doceri | 2 - Just JRE | 3 - None): "
	if ($ANS -eq "1")	{
		Write-Output "Installing Doceri Installer..."
		./Doceri_Desktop_setup_2_1_9.exe
	}
	elseif (($ANS -eq "2") -or ($ANS -eq "1")) {
		Write-Output "Launching JRE Installer...`n"
		./jre-8u351-windows-i586-iftw.exe
	}
	else {
		Write-Output "Skipping JRE & Doceri`n"
	}
}

# Checks to see if AirServer is installed (This doesn't seem to work for now)
#if ( -Not (Test-Path -Path "C:\Program Files\App Dynamic\AirServer"))	{
#	Write-Output "Launching AirServer Installer..."
#	./AirServer-5.6.2-x64.exe
#}

# Looks for ESET
if ($null -eq (Get-Command "C:\Program Files\ESET\ESET Security\ecmds.exe" -ErrorAction SilentlyContinue))   {
	Write-Output "Installing ESET..."
	Write-Output "! - ESET has some issues before, if you are experiencing any. Please reboot the system and manually install ESET."
	./"Protect_Installer_x64_en_US 9.0.exe"
}

# Looks for Adobe Acrobat Reader 
if ($null -eq (Get-Command "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" -ErrorAction SilentlyContinue))   {
	# Acrobat usually fails to install when multiple things are installing, this hopefully lets Acrobat install
	
	Write-Output "Launching Adobe Acrobat Installer...`n"
	./readerdc64_en_xa_crd_mdr_install.exe
	
	# Wait for user to press enter.
	Write-Output "Press enter when Adobe Acrobat is finished installing."
	Read-Host "[Enter]"

	if ( -Not (Test-Path -Path ".\readerdc64_en_xa_crd_mdr_install.exe" -ErrorAction SilentlyContinue))	{
		Write-Output "Successfully placed Acrobat back in its place!"
		Copy-Item ".\acrobatcopy\readerdc64_en_xa_crd_mdr_install.exe" -Destination ".\"
	}
	else {
		Write-Output "Failed to place Acrobat back in its place (File already exists)"
	}
}

Write-Output "`n`n`nFinished installing packages... Now time to update!"
Read-Host "[Enter when you are ready]"

Read-Host "Updating packages... Please accept the prompts when they come up!"

winget.exe upgrade --accept-source-agreements --accept-package-agreements
winget.exe upgrade --all
