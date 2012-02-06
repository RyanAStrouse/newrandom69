#
# get a random snoop quote
#
#

module.exports = (robot) ->

  robot.respond /snoop me/i, (msg) ->
    qts = ["Rollin down the street, smokin indo, sippin on gin and juice", "Laid back (with my mind on my money and my money on my mind)", "When the pimps in the crib ma drop it like its hot"]
	rnd = Math.floor(Math.random() * qts.length)
	msg.send qts[rnd]