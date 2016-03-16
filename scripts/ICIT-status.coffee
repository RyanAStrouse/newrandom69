# Description:
#   Gives you the status of ICIT
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot is ICIT down - Gives you ICIT's status
#

answers = ["yes", "no"]

module.exports = (robot) ->
  robot.respond /is (ICIT|icit) (down|slow)/i, (msg) ->
    msg.reply msg.random answers
