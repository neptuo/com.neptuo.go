param([string]$buildFolder)

$outputPath = "..\output";
$sitePath = "$($buildFolder)\src\WebSite"
$port = 58537
$delay = 3000

Write-Host "Running IIS Express from '$($sitePath)' at '$($port)'."
$iis = Start-Process "C:\Program Files (x86)\IIS Express\iisexpress.exe" -NoNewWindow -ArgumentList "/path:$($sitePath) /port:$($port)"

Write-Host "Waiting $($delay)."
Start-Sleep -Milliseconds $delay

Write-Host "Running StaticSiteCrawler."
.\Tools\StaticSiteCrawler.exe http://localhost:$($port)/ $outputPath /

Copy-Item "$($sitePath)\Content\Images" "$($outputPath)\Content\Images" -Force -Recurse
Copy-Item "$($sitePath)\Content\bootstrap.min.css" "$($outputPath)\Content" -Force -Recurse
Copy-Item "$($sitePath)\Content\bootstrap-theme.min.css" "$($outputPath)\Content" -Force -Recurse
Copy-Item "$($sitePath)\Content\web.css" "$($outputPath)\Content" -Force -Recurse
Copy-Item "$($sitePath)\fonts" "$($outputPath)\fonts" -Force -Recurse
Copy-Item "$($sitePath)\Scripts" "$($outputPath)\Scripts" -Force -Recurse

Write-Host "Content of output:"
$items = Get-ChildItem -Path $outputPath
ForEach ($item in $items) 
{ 
    $size = (Get-Item "$($outputPath)\$($item)").Length
    Write-Host "'$($item)' - $($size)B"
}

Write-Host "Stopping IIS Express."
Stop-Process -Name iisexpress