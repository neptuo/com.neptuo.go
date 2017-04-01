Tools\StaticSiteCrawler.exe http://localhost:58537/ ..\output /

xcopy src\WebSite\Content\Images ..\output\Content\Images /E /R /Y
xcopy src\WebSite\Content\bootstrap.min.css ..\output\Content /R /Y
xcopy src\WebSite\Content\bootstrap-theme.min.css ..\output\Content /R /Y
xcopy src\WebSite\Content\web.css ..\output\Content /R /Y
xcopy src\WebSite\fonts ..\output\fonts /E /R /Y
xcopy src\WebSite\Scripts ..\output\Scripts /E /R /Y