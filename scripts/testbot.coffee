http = require 'http'

module.exports = (robot) ->
  robot.respond /ルーレット/i, (msg) ->
    array = [
    ]
    http.get {host: 'www.google.com'}, (res) ->
      code = res.statusCode
      console.log(code)
      msg.send code.toString()

#    msg.send "@"+ array[Math.floor(Math.random() * array.length)]


