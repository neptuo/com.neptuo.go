param([string]$buildFolder)

$outputPath = "..\output";
$sitePath = "$($buildFolder)\src\WebSite"
$port = 58537
$delay = 5000

Write-Host "Running IIS Express from '$($sitePath)' at '$($port)'."
$iis = Start-Process "C:\Program Files (x86)\IIS Express\iisexpress.exe" -NoNewWindow -ArgumentList "/path:$($sitePath) /port:$($port)"

Write-Host "Waiting $($delay)."
Start-Sleep -Milliseconds $delay

If ($iis.HasExited)
{
    Write-Host "IIS has exited";
}

Write-Host "Running StaticSiteCrawler."
#Start-Process "$($buildFolder)\Tools\StaticSiteCrawler.cmd" -Wait
.\Tools\StaticSiteCrawler.exe http://localhost:$($port)/ $outputPath /

Write-Host "Content of output:"
$items = Get-ChildItem -Path $outputPath
ForEach ($item in $items) 
{ 
    $size = (Get-Item "$($outputPath)\$($item)").Length
    Write-Host "'$($item)' - $($size)B"
}

Write-Host "Stopping IIS Express."
Stop-Process -Name iisexpress