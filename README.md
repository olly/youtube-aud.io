# youtube-aud.io

A quick and dirty streaming proxy server that strips the audio track from a 
YouTube video and streams it to the browser.

## Instructions

Run the server:

    coffee app.coffee

Hit the [server](http://localhost:3000) and enter a YouTube URL.

## Dependencies

- ffmpeg. [http://ffmpeg.org](http://ffmpeg.org)
- youtube-dl. [http://rg3.github.com/youtube-dl/](http://rg3.github.com/youtube-dl/)

## Known Issues

- Only works in Chrome.
