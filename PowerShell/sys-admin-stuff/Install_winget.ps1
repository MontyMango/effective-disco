# Installs winget from their GitHub and saves it onto the current directory
Invoke-WebRequest -O "winget.msixbundle" "https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

# Adds Winget Package
Add-AppxPackage -Path ".\winget.msixbundle"

# Removes the winget bundle after it is finished with it
Remove-Item ".\winget.msixbundle"