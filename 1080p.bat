@echo off
set inputFile=%1
set outputFile=%~dpn1-1080p-web.mp4
@echo on
ffmpeg -i "%inputFile%" -c:v libx264 -profile:v high -level 4.1 -vf "format=yuv420p,scale='min(1920,iw)':'min(1080,ih)':force_original_aspect_ratio=decrease" "%outputFile%"
@echo off
echo 转码成功，文件保存到 %outputFile%
echo 按任意键关闭窗口...
pause >nul
