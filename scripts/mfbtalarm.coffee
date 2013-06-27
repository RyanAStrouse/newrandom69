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

checkTime ->
  now = new Date()
  hour = now.getHours()
  day = now.getDay()
  if day >= 3 && hour >= 17 
    robot.emit "mfbt"
    clearInterval intv
    false
  
intv = setInterval checkTime, 60 * 1000

module.exports = (robot) ->
  robot.on "mfbt"
    robot.messageRoom 2040, 'its mfbt!'