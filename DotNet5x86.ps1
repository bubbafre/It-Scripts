###### Vars#####
# powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/bubbafre/It-Scripts/main/DotNet5x86.ps1'))" 
$URL = "https://download.visualstudio.microsoft.com/download/pr/4a79fcd5-d61b-4606-8496-68071c8099c6/2bf770ca40521e8c4563072592eadd06/dotnet-runtime-5.0.13-win-x86.exe"
$OutputURL = "C:\temp\dotnet-runtime-5.0.13-win-x86.exe"

#creating temp folder
mkdir C:\temp\ -ErrorAction SilentlyContinue

$software =  "Microsoft .NET Runtime - 5"
$installed = (Get-ItemProperty HKLM:\SOFTWARE\Classes\Installer\Products\* | Where { $_.ProductName -match $software }) -ne $null

If(-Not $installed) {
    Write-Host "'$software' NOT is installed."
    Write-host "Starting Dotnet-runtime x86 installation"
    Invoke-WebRequest -Uri "$URL" -OutFile "$outputURL"

##Starting Install
Write-host Starting $software installation
Start-Process -NoNewWindow -FilePath "C:\temp\dotnet-runtime-5.0.13-win-x86.exe" -ArgumentList "/install /quiet /norestart"

} else { Write-host $software already installed }


