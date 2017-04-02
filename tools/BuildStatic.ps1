param([string]$buildFolder)

$path = "$($buildFolder)\src\WebSite"
$port = 58537
$delay = 5000

Write-Host "Running IIS Express from '$($path)'."
Start-Process "C:\Program Files (x86)\IIS Express\iisexpress.exe" -NoNewWindow -ArgumentList "/path:$($path) /port:$($port)"

Write-Host "Running StaticSiteCrawler."
Start-Process "$($buildFolder)\Tools\StaticSiteCrawler.cmd"

Write-Host "Waiting $($delay)."
Start-Sleep -Milliseconds $delay

Write-Host "Content of output:"
Get-ChildItem -Path ..\output

Write-Host "Stopping IIS Express."
Stop-Process -Name iisexpress