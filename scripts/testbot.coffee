http = require 'follow-redirects'
#http = http.http
http = http.https

url = process.env.URL
spread_sheet_url = process.env.SpreadSheetUrl

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
          # スレッドかの判定
          res_msg = '@' + obj.target.toString()
          if msg.message.thread_ts?
            msg.send res_msg
          else
            msg.message.thread_ts = msg.message.rawMessage.ts
            msg.send res_msg
      else
        console.log "error: #{res.statusCode}"
  robot.hear /チームランチ行く/i, (msg) ->
    http.get
#      host: 'localhost'
      host: 'script.google.com'
#      port: 3000
#      path: '/lunch_target'
      path: url + '?action=team_lunch'
    , (res) ->
      if res.statusCode is 200
        body = ''
        res.setEncoding 'utf8'
        res.on 'data', (chunk) ->
          body += chunk
        res.on 'end', ->
          console.log body
          obj = JSON.parse(body)
          #          console.log obj.users
          member = ''
          for value, index in obj.users
#            console.log index, value
            member += '@' + value.toString() + ' '
          #          console.log(member)
          msg.send member + 'チームランチの時間だよ!! <' + spread_sheet_url + '|設定はここから>'
      else
        console.log "error: #{res.statusCode}"
