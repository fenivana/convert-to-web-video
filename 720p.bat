@echo off
set inputFile=%1
set outputFile=%~dpn1-720p-web.mp4
@echo on
ffmpeg -i "%inputFile%" -c:v libx264 -profile:v high -level 4.1 -vf "format=yuv420p,scale='min(1280,iw)':'min(720,ih)':force_original_aspect_ratio=decrease" "%outputFile%"
@echo off
echo ת��ɹ����ļ����浽 %outputFile%
echo ��������رմ���...
pause >nul
