# Description:
#   Display a wolf shirt review
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot wolf shirt me
#   
# Author:
#   paul?
#
#

module.exports = (robot) ->

  robot.respond /(wolf shirt me)/i, (msg) ->
    quotes = ["This item has wolves on it which makes it intrinsically sweet and worth 5 stars by itself, but once I tried it on, that's when the magic happened. After checking to ensure that the shirt would properly cover my girth, I walked from my trailer to Wal-mart with the shirt on and was immediately approached by women. The women knew from the wolves on my shirt that I, like a wolf, am a mysterious loner who knows how to 'howl at the moon' from time to time (if you catch my drift!). The women that approached me wanted to know if I would be their boyfriend and/or give them money for something they called mehth. I told them no, because they didn't have enough teeth, and frankly a man with a wolf-shirt shouldn't settle for the first thing that comes to him.", "Unfortunately I already had this exact picture tattooed on my chest, but this shirt is very useful in colder weather.", "For you left brain types out there, who are still unsure on whether or not this shirt would make a wise purchase, allow me to break it down for you. Most shirts like this only contain one wolf. This shirt has three wolves, plus a moon. You are basically getting three wolves and a moon for the price on one wolf. You won't find that deal anywhere else.","So I'm looking for threads that say, 'Hey baby...I'm real boss!' when I stumble upon this epic creation. The wolves spoke to me in a language all their own; it was like German, Mongol, and Bitchin all mixed together. I mean, one wolf howlin at the moon is major...but three???","Just wanted to post on here, be careful to order your shirt from here only. I was looking to get one cheaper, and bought one off Ebay, but didn't read it carefully enough. You guessed it, one wolf, three moons. I mean its ok to wear I guess, but if you look carefully you can tell its not the real thing. It hasn't made me as confident as the real one would of, but at least I THINK about the real one when I wear it, and that helps a bit I guess."]
    rnd = Math.floor(Math.random() * quotes.length)
    msg.send quotes[rnd]
