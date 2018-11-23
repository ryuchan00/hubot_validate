http = require 'http'

http.get
  host: 'localhost'
  port: 3000
  path: '/movies'
, (res) ->
  if res.statusCode is 200
    body = ''
    res.setEncoding 'utf8'
    res.on 'data', (chunk) ->
      body += chunk
    res.on 'end', ->
      console.log body
      obj = JSON.parse(body)
      console.log obj[0].id
  else
    console.log "error: #{res.statusCode}"
