spawn = require('child_process').spawn

class AudioExtractor
  commandName = 'ffmpeg'

  # (-i) read from stdin
  # (-vn) extract audio
  # (-f) mp3 format
  # (-ac) 2 audio channels
  # (-) write to stdout
  commandOptions = ['-i', '-', '-vn', '-f', 'mp3', '-ac', '2',  '-']

  constructor: (stream) ->
    @process = spawn(commandName, commandOptions)

    @process.stderr.on 'data', (data) ->
      console.log(data.toString('ascii'))

    @process.stdin.on 'error', (err) ->
      console.log('AudioExtractor stdin error:', err)

    @process.stdout.on 'error', ->
      console.log('AudioExtractor stdout error', err)

module.exports = AudioExtractor
