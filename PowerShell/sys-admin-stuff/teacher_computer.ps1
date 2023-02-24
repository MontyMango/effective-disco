# Looks for Adobe Acrobat Reader
if ($null -eq (Get-Command "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe" -ErrorAction SilentlyContinue))   {
	./readerdc64_en_xa_crd_mdr_install.exe
}

# Looks for Chrome
if (($null -eq (Get-Command "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -ErrorAction SilentlyContinue)) -and ($null -eq (Get-Command "C:\Program Files\Google\Chrome\Application\chrome.exe" -ErrorAction SilentlyContinue)))   {
		./ChromeSetup.exe
}

# Looks for VLC
if ($null -eq (Get-Command "C:\Program Files\VideoLAN\VLC\vlc.exe" -ErrorAction SilentlyContinue))   {
	./vlc-3.0.11-win64.exe
}

# Checks to see if Duo has been installed
if ( -Not (Test-Path -Path "C:\Program Files\Duo Security"))	{
	./duo-win-login-4.2.0.exe
}

# Looks for JRE & Doceri
if ( -Not (Test-Path -Path "C:\Program Files (x86)\Java"))	{
	./jre-8u351-windows-i586-iftw.exe
	./Doceri_Desktop_setup_2_1_9.exe
}

# Checks to see if AirServer is installed
if ( -Not (Test-Path -Path "C:\Program Files\App Dynamic\AirServer\"))	{
	./AirServer-5.6.2-x64.exe
}

# Looks for ESET
if ($null -eq (Get-Command "C:\Program Files\ESET\ESET Security\ecmds.exe" -ErrorAction SilentlyContinue))   {
	./"PROTECT_Installer_x64_en_US 8.0.exe"
}