#http = require 'https'
http = require 'follow-redirects'
http = http.https

http.get
  host: 'script.google.com'
#  port: 3000
  path: '/macros/s/AKfycbyO4NJf21sY9DCfV0ySp28Vrk7YvSoc8b2Jac9TV_ptkTnTWg0/exec'
, (res) ->
  if res.statusCode is 200
    body = ''
    res.setEncoding 'utf8'
    res.on 'data', (chunk) ->
      body += chunk
    res.on 'end', ->
      console.log body
      obj = JSON.parse(body)
      console.log obj[0].user
  else
    console.log "error: #{res.statusCode}"
