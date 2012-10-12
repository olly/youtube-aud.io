AudioExtractor = require('./lib/audio_extractor')
YouTubeDownload = require('./lib/youtube_download')

express = require('express')
app = express.createServer()

app.listen 3000
app.use(express.bodyParser())

app.get '/', (request, response) ->
  response.sendfile('./public/index.html')

app.post '/', (request, response) ->
  console.log(request.body.url)
  streamURL = "/stream?url=#{request.body.url}"
  response.send("<html><body><audio src=\"#{streamURL}\" controls=\"true\"></body></html>")
  response.send(200)

app.get '/stream', (request, response) ->
  downloader = new YouTubeDownload(request.query.url)
  extractor = new AudioExtractor()
  
  response.contentType('audio/mpeg')
  response.header('Transfer-Encoding', 'chunked')
  
  downloader.process.stdout.pipe(extractor.process.stdin)
  extractor.process.stdout.pipe(response)
