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


#  http.get {host: 'www.google.com'}, (res) ->
#    code = res.statusCode
#    console.log(code)
#    msg.send code.toString()

#    msg.send "@"+ array[Math.floor(Math.random() * array.length)]

#http.get
#  host: 'script.google.com'
#  path: '/macros/s/AKfycbyO4NJf21sY9DCfV0ySp28Vrk7YvSoc8b2Jac9TV_ptkTnTWg0/exec'
#, (res) ->
#  if res.statusCode is 200
#    body = ''
#    res.setEncoding 'utf8'
#    res.on 'data', (chunk) ->
#      body += chunk
#    res.on 'end', ->
#      console.log body
#      obj = JSON.parse(body)
#      console.log obj.user
#  else
#    console.log "error: #{res.statusCode}"
