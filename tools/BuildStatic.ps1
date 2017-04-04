param([string]$buildFolder)

$path = "$($buildFolder)\src\WebSite"
$port = 58537
$delay = 3000

Write-Host "Running IIS Express from '$($path)'."
Start-Process "C:\Program Files (x86)\IIS Express\iisexpress.exe" -NoNewWindow -ArgumentList "/path:$($path) /port:$($port)"

Write-Host "Waiting $($delay)."
Start-Sleep -Milliseconds $delay

Write-Host "Running StaticSiteCrawler."
#Start-Process "$($buildFolder)\Tools\StaticSiteCrawler.cmd" -Wait
.\Tools\StaticSiteCrawler.exe http://localhost:$($port)/ ..\output /

Write-Host "Content of output:"
$items = Get-ChildItem -Path ..\output
ForEach ($item in $items) 
{ 
    $size = (Get-Item $item).Length
    Write-Host "$($item) - $($size)"
}

Write-Host "Stopping IIS Express."
Stop-Process -Name iisexpress