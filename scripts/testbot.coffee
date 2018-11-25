http = require 'follow-redirects'
http = http.https

url = process.env.URL

module.exports = (robot) ->
  robot.respond /ルーレット/i, (msg) ->
    http.get
      host: 'script.google.com'
      path: url
    , (res) ->
      if res.statusCode is 200
        body = ''
        res.setEncoding 'utf8'
        res.on 'data', (chunk) ->
          body += chunk
        res.on 'end', ->
          console.log body
          obj = JSON.parse(body)
          console.log obj.target
          msg.send obj.target
      else
        console.log "error: #{res.statusCode}"
