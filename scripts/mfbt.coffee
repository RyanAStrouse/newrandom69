module.exports = (robot) ->
  robot.respond /(is it mfbt)/i, (msg) ->
    now = new Date()
    hour = now.getHours()
    day = now.getDay()
    if day == 5 && hour >= 15
      msg.send "YES IT IS"
    else
      msg.send "NOT YET"
