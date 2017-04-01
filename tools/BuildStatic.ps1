param([string]$buildFolder)

$path = "$($buildFolder)\src\WebSite"
$port = 58537

Start-Process "C:\Program Files (x86)\IIS Express\iisexpress.exe" -NoNewWindow -ArgumentList "/path:$($path) /port:$($port)"
Start-Process "$($buildFolder)\Tools\StaticSiteCrawler.cmd"

Stop-Process -Name iisexpress