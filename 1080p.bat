@echo off
%~d0
cd %~dp0

:: https://stackoverflow.com/questions/8547676/droplet-batch-script-filenames-containing-ampersands
setlocal disableDelayedExpansion
::
:: first assume normal call, get args from %*
set args=%*
set "dragDrop="
::
:: Now check if drag&drop situation by looking for %0 in !cmdcmdline!
:: if found then set drag&drop flag and get args from !cmdcmdline!
setlocal enableDelayedExpansion
set "cmd=!cmdcmdline!"
set "cmd2=!cmd:*%~f0=!"
if "!cmd2!" neq "!cmd!" (
  set dragDrop=1
  set "args=!cmd2:~0,-1! "
  set "args=!args:* =!"
)
::
:: Process the args
for %%F in (!args!) do (
  if "!!"=="" endlocal & set "dragDrop=%dragDrop%"
  rem ------------------------------------------------
  rem - Your file processing starts here.
  rem - Each file will be processed one at a time
  rem - The file path will be in %%F
  rem -
  echo Process file %%~F
  ffmpeg -i "%%~F" -c:v libx264 -profile:v high -level 4.1 -vf "format=yuv420p,scale='min(1920,iw)':'min(1080,ih)':force_original_aspect_ratio=decrease" "%%~dpnF-1080p-web.mp4"
  echo Done. File output to %%~dpnF-720p-web.mp4
  rem -
  rem - Your file processing ends here
  rem -------------------------------------------------
)

echo Press any key to close...
pause >nul

::
:: If drag&drop then must do a hard exit to prevent unwanted execution
:: of any split drag&drop filename argument
if defined dragDrop (
  exit
)
