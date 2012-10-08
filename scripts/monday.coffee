# monday me

module.exports = (robot) ->

	robot.respond /(monday)( me)/i, (msg) ->
		msg.send "Sounds like someone has a case of the Mondays"
