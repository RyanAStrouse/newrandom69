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
#   hubot alerts?
#   
# Author:
#   cgack
#



module.exports = (robot) ->
  checkTime = () ->
    now = new Date()
    hour = now.getHours()
    day = now.getDay()
    min = now.getMinutes()
    if day == 5 && hour >= 19 && min >= 17
      robot.messageRoom '#random', 'HEY! its MFBT!'
      clearInterval intv
      false
  
  intv = setInterval checkTime, 60 * 1000
  false
