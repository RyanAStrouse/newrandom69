# Description:
#   Respond to bye felicia
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot byefelicia - Reply back with bye felicia gif
#
# Author:
#   rstrouse

module.exports = (robot) ->
	robot.respond /byefelicia$/i, (msg) ->
		msg.send "https://media2.giphy.com/media/11QJgcchgwskq4/giphy.gif"
