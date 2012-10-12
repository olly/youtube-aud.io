spawn = require('child_process').spawn

class YouTubeDownload
  commandName = 'youtube-dl'

  # (-o) write to stdout
  # (-q) quietly
  defaultOptions = ['-o', '-', '-q']

  constructor: (url) ->
    options = defaultOptions.concat(url)
    @process = spawn(commandName, options)

    @process.stderr.on 'data', (data) ->
      console.log(data.toString('ascii'))

    @process.stdin.on 'error', (err) ->
      console.log('YouTubeDownload stdin error:', err)

    @process.stdout.on 'error', ->
      console.log('YouTubeDownload stdout error:', err)

module.exports = YouTubeDownload