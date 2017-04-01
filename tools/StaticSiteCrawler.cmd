Tools\StaticSiteCrawler.exe http://localhost:58537/ docs /

xcopy src\WebSite\Content\Images ..\output\docs\Content\Images /E /R /Y
xcopy src\WebSite\Content\bootstrap.min.css ..\output\docs\Content /R /Y
xcopy src\WebSite\Content\bootstrap-theme.min.css ..\output\docs\Content /R /Y
xcopy src\WebSite\Content\web.css ..\output\docs\Content /R /Y
xcopy src\WebSite\fonts ..\output\docs\fonts /E /R /Y
xcopy src\WebSite\Scripts ..\output\docs\Scripts /E /R /Y