# Description:
#   hall of fame
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot hall of fame show
#   hubot hall of fame show top
#   hubot hall of fame reset
#   hubot hall of fame <text or link>
#
# Author:
#   cgack
#

module.exports = (robot) ->
	robot.respond /hall of fame (.*)\?*$/i, (msg) ->
		item = msg.match[1]
		
		response = ""
		store = robot.brain.data.hof ? []


		if item is 'show'
			if store.length > 0
				for i in [0..store.length - 1]
					response += robot.brain.data.hof[i] + ', '
				response = response.substring 0, response.length - 2
			else
				response = "nothing has been added to the hall of fame"
		else if item is 'show top'
			freq = {}
			max = 0
			store = robot.brain.data.hof
			for v in store
				freq[store[v]] = (freq[store[v]] ? 0) + 1
				if freq[store[v]] > max
					max = freq[store[v]]
					response = v + ' has the most votes'
			if response ? "nothing has been added to the hall of fame" else response
				
		else if item is 'reset'
			robot.brain.data.hof = []
			response = 'hall of fame reset'
		else
			robot.brain.data.hof = robot.brain.data.hof || []
			robot.brain.data.hof.push item
			response = item + ' added to hall of fame'
			
		msg.send response
