module.exports = (robot) ->
  robot.respond /ルーレット/i, (msg) ->
    array = [
    ]
    msg.send "@"+ array[Math.floor(Math.random() * array.length)]
