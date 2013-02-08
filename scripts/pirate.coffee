# Description:
#   Talk like a pirate
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot talk like a pirate
#   
# Author:
#   unknown
#

module.exports = (robot) ->

  robot.respond /(talk like a pirate)/i, (msg) ->
    quotes = ["Ahoy!", "Avast!", "Aye aye!", "Well, me hearties, let's see what crawled out of the bung hole", "Arrr!"]
    msg.send msg.random quotes
