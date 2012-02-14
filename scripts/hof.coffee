

module.exports = (robot) ->
	robot.respond /hall of fame ([\w .-]+)\?*$/i, (msg) ->
		item = msg.match[1]
		
		robot.brain.data.hof.push item