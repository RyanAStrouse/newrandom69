# Description:
#   Displays server time
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   unknown

module.exports = (robot) ->
  robot.respond /(what time do you think it is)/i, (msg) ->
    now = new Date()
    msg.send now
