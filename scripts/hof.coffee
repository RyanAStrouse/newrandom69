# hall of fame

module.exports = (robot) ->
	robot.respond /hall of fame ([\w .-]+)\?*$/i, (msg) ->
		item = msg.match[1]
		
		response = ""
		if item is 'show'
			for i in [0..robot.brain.data.hof.length - 1]
				response += robot.brain.data.hof[i] + ', '
			response = response.substring 0, response.length - 2
		else if item is 'show top'
			freq = {}
			max = 0
			store = robot.brain.data.hof
			for v in store
				freq[store[v]] = (freq[store[v]] ? 0) + 1
				if freq[store[v]] > max
					max = freq[store[v]]
					response = v + ' has ' + max + ' votes'
		else if item is 'reset'
			robot.brain.data.hof = []
			response = 'hall of fame reset'
		else
			robot.brain.data.hof = robot.brain.data.hof || []
			robot.brain.data.hof.push item
			response = item + 'added to hall of fame'
			
		msg.send response