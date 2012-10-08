# hall of shame

module.exports = (robot) ->
	robot.respond /hall of shame (.*)\?*$/i, (msg) ->
		item = msg.match[1]
		
		response = ""
		store = robot.brain.data.hos ? []


		if item is 'show'
			if store.length > 0
				for i in [0..store.length - 1]
					response += robot.brain.data.hos[i] + ', '
				response = response.substring 0, response.length - 2
			else
				response = "nothing has been added to the hall of shame"
		else if item is 'show top'
			freq = {}
			max = 0
			store = robot.brain.data.hos
			for v in store
				freq[store[v]] = (freq[store[v]] ? 0) + 1
				if freq[store[v]] > max
					max = freq[store[v]]
					response = v + ' has the most votes'
			if response ? "nothing has been added to the hall of shame" else response
				
		else if item is 'reset'
			robot.brain.data.hos = []
			response = 'hall of shame reset'
		else
			robot.brain.data.hos = robot.brain.data.hos || []
			robot.brain.data.hos.push item
			response = item + ' added to hall of shame'
			
		msg.send response
