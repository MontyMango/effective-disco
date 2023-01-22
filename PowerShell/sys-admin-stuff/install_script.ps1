# Looks for the Adobe Acrobat Reader executable 
if ($null -eq (Get-Command "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" -ErrorAction SilentlyContinue))   {
	./readerdc64_en_xa_crd_mdr_install.exe
}

# Looks for the Chrome executable
if (($null -eq (Get-Command "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -ErrorAction SilentlyContinue)) -and ($null -eq (Get-Command "C:\Program Files\Google\Chrome\Application\chrome.exe" -ErrorAction SilentlyContinue)))   {
		./ChromeSetup.exe
}

# Looks for VLC
if ($null -eq (Get-Command "C:\Program Files\VideoLAN\VLC\vlc.exe" -ErrorAction SilentlyContinue))   {
	./vlc-3.0.11-win64.exe
}

# Checks to see if Duo has been installed
if ( -Not (Test-Path -Path "C:\Program Files\Duo Security"))	{
	Write-Output "The latest windows update should install Duo automatically, but you can manually install it now if you wish to."
	$ANS = Read-Host "Would you like to install Duo now? (y/n): "
	if ($ANS -eq "y") {
		Write-Output "Installing Duo..."
		./duo-win-login-4.2.0.exe
		./keys.txt
	}
	else {
		Write-Output "Skipping Duo Install..."
	}

}

# Looks for JRE & Doceri
if ( -Not (Test-Path -Path "C:\Program Files (x86)\Java"))	{
	./jre-8u351-windows-i586-iftw.exe
	# If Doceri is needed uncomment the command below!
	#./Doceri_Desktop_setup_2_1_9.exe
}

# Checks to see if AirServer is installed (This doesn't seem to work for now)
#if ( -Not (Test-Path -Path "C:\Program Files\App Dynamic\AirServer"))	{
#	./AirServer-5.6.2-x64.exe
#}

# Looks for ESET
if ($null -eq (Get-Command "C:\Program Files\ESET\ESET Security\ecmds.exe" -ErrorAction SilentlyContinue))   {
	Write-Output "ESET has some issues before, if you are experiencing any. Please reboot the system and manually install ESET."
	./"PROTECT_Installer_x64_en_US 8.0.exe"
}

# Wait 3 minutes before putting Acrobat back into the main directory
Write-Output "The system will wait for 5 minutes... (Acrobat install usually takes about 2 minutes and 30 seconds)"
Start-Sleep 300

if ( -Not (Test-Path -Path ".\readerdc64_en_xa_crd_mdr_install.exe" -ErrorAction SilentlyContinue))	{
	Copy-Item ".\acrobatcopy\readerdc64_en_xa_crd_mdr_install.exe" -Destination ".\"
}
