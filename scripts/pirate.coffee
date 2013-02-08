#
# Talk like a pirate

module.exports = (robot) ->

  robot.respond /(talk like a pirate)/i, (msg) ->
    quotes = ["Ahoy!", "Avast!", "Aye aye!", "Well, me hearties, let's see what crawled out of the bung hole", "Arrr!"]
    rnd = Math.floor(Math.random() * quotes.length)
    msg.send quotes[rnd]
