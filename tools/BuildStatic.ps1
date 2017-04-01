param([string]$buildFolder)

$path = "$($buildFolder)\src\WebSite"
$port = 58537

$process = Start-Process 'C:\Program Files (x86)\IIS Express\iisexpress.exe' -NoNewWindow -ArgumentList "/path:$($path) /port:$($port)"

stop-process -Name iisexpress