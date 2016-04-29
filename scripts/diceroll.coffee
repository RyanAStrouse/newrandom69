# Description:
#   Provides a random roll for different sided dice
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot d<N> - roll one N-sided dice
#   hubot <X>d<N> - roll X N-sided dice
#
# Author:
#   DungeonMaster

module.exports = (robot) ->
  robot.respond /(\d+)d(\d+)$/i, (msg) ->
    x = msg.match[1]
    n = msg.match[2]
    msg.send '' + [0...x].reduce (s) ->
    	s + Math.floor(Math.random() * n) + 1
	, 0
