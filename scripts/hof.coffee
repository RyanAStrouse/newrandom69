

module.exports = (robot) ->
	robot.respond /hall of fame ([\w .-]+)\?*$/i, (msg) ->
		item = msg.match[1]
		
		if item is 'show'
			response = ""
			for i in [0..robot.brain.data.hof.length - 1]
				response += robot.brain.data.hof[i]
			msg.send response
		else
			robot.brain.data.hof = robot.brain.data.hof || []
			robot.brain.data.hof.push item
			msg.send item + 'added to hall of fame'