http = require 'http'

http.get {host: 'www.google.com'}, (res) ->
  console.log res.statusCode
