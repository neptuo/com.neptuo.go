param([string]$buildFolder)

$outputPath = "..\output";
$sitePath = "$($buildFolder)\src\WebSite"
$port = 58537
$delay = 3000

# Start IIS.
Write-Host "Running IIS Express from '$($sitePath)' at '$($port)'."
$iis = Start-Process "C:\Program Files (x86)\IIS Express\iisexpress.exe" -NoNewWindow -ArgumentList "/path:$($sitePath) /port:$($port)"

Write-Host "Waiting $($delay)."
Start-Sleep -Milliseconds $delay

# Crawl site.
Write-Host "Running StaticSiteCrawler."
.\Tools\StaticSiteCrawler.exe http://localhost:$($port)/ $outputPath /

# Copy assets.
If (Test-Path "$($sitePath)\Content\Images") 
{
    Copy-Item "$($sitePath)\Content\Images" "$($outputPath)\Content\Images" -Force -Recurse
}
Copy-Item "$($sitePath)\Content\web.css" -Destination "$($outputPath)\Content\web.css" -Force -Recurse
Copy-Item "$($sitePath)\Scripts" "$($outputPath)\Scripts" -Force -Recurse

# Debug print output.
Write-Host "Content of output:"
$items = Get-ChildItem -Path $outputPath
ForEach ($item in $items) 
{ 
    $size = (Get-Item "$($outputPath)\$($item)").Length
    Write-Host "'$($item)' - $($size)B"
}

# Stop IIS.
Write-Host "Stopping IIS Express."
Stop-Process -Name iisexpress