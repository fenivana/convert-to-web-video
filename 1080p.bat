@echo off
set inputFile=%1
set outputFile=%~dpn1-1080p-web.mp4
@echo on
ffmpeg -i "%inputFile%" -c:v libx264 -profile:v high -level 4.1 -vf "format=yuv420p,scale='min(1920,iw)':'min(1080,ih)':force_original_aspect_ratio=decrease" "%outputFile%"
@echo off
echo ת��ɹ����ļ����浽 %outputFile%
echo ��������رմ���...
pause >nul
