#http = require 'https'
http = require 'follow-redirects'
http = http.https

url = process.env.URL

http.get
  host: 'script.google.com'
#  port: 3000
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
  else
    console.log "error: #{res.statusCode}"
