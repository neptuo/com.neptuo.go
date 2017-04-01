Tools\StaticSiteCrawler.exe http://localhost:58537/ docs /

xcopy src\WebSite\Content\Images docs\Content\Images /E /R /Y
xcopy src\WebSite\Content\bootstrap.min.css docs\Content /R /Y
xcopy src\WebSite\Content\bootstrap-theme.min.css docs\Content /R /Y
xcopy src\WebSite\Content\web.css docs\Content /R /Y
xcopy src\WebSite\fonts docs\fonts /E /R /Y
xcopy src\WebSite\Scripts docs\Scripts /E /R /Y