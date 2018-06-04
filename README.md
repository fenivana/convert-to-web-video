# HTML5 Video Converter (Windows x64)

Drag and drop videos onto [720p.bat] or [1080p.bat] batch file to convert.

The underlying ffmpeg command:

720p:
```sh
ffmpeg -i INPUT_FILE -c:v libx264 -profile:v high -level 4.1 -vf "format=yuv420p,scale='min(1280,iw)':'min(720,ih)':force_original_aspect_ratio=decrease" OUTPUT_FILE.mp4
```

1080p:
```sh
ffmpeg -i INPUT_FILE -c:v libx264 -profile:v high -level 4.1 -vf "format=yuv420p,scale='min(1920,iw)':'min(1080,ih)':force_original_aspect_ratio=decrease" OUTPUT_FILE.mp4
```

## License
[MIT](LICENSE)
