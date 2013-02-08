# Description:
#   Mondays
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot monday me
#   
# Author:
#   unknown
#

module.exports = (robot) ->

	robot.respond /(monday)( me)/i, (msg) ->
		msg.send "Sounds like someone has a case of the Mondays"
