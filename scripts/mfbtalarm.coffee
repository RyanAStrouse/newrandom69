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
    if day >= 3 && hour >= 17 
      robot.messageRoom 2040, 'its mfbt!'
      clearInterval intv
      false
  
  intv = setInterval checkTime, 60 * 1000
  false
