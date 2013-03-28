# Description:
#   MFBT
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot is it mfbt
#   
# Author:
#   cgack
#

module.exports = (robot) ->
  robot.respond /(is it mfbt)/i, (msg) ->
    now = new Date()
    hour = now.getHours()
    day = now.getDay()
    if day >= 4 && hour >= 19 
      msg.send "YES IT IS"
    else
      msg.send "NOT YET"
