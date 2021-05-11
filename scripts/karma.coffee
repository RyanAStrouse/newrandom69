# Description:
#   Track arbitrary karma
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   <thing>++ - give thing some karma
#   <thing>-- - take away some of thing's karma
#   hubot karma <thing> - check thing's karma (if <thing> is omitted, show the top 5)
#   hubot karma empty <thing> - empty a thing's karma
#   hubot karma best - show the top 5
#   hubot karma worst - show the bottom 5
#
# Author:
#   stuartf & rstrouse

class Karma
  
  constructor: (@robot) ->
    @cache = {}
    
    @increment_responses = [
      "+1!", "gained a level!", "is on the rise!", "leveled up!"
    ]
  
    @decrement_responses = [
      "took a hit! Ouch.", "took a dive.", "lost a life.", "lost a level."
    ]
    
    @robot.brain.on 'loaded', =>
      if @robot.brain.data.karma
        @cache = @robot.brain.data.karma
  
  kill: (thing) ->
    delete @cache[thing]
    @robot.brain.data.karma = @cache
  
  increment: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] = parseInt(@cache[thing], 10)
    @cache[thing] += 1
    console.log("The increment thing: ", @cache[thing])
    @robot.brain.data.karma = @cache

  decrement: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] = parseInt(@cache[thing], 10)
    @cache[thing] -= 1
    console.log("The decrement thing: ", @cache[thing])
    @robot.brain.data.karma = @cache
    
  set: (thing, val) ->
    console.log("The thing: ", thing)
    console.log("The val: ", val)
    @cache[thing] = parseInt( val, 10 );
    console.log("The parseInt is: ", val)
    @robot.brain.data.karma = @cache
  
  incrementResponse: ->
     @increment_responses[Math.floor(Math.random() * @increment_responses.length)]
  
  decrementResponse: ->
     @decrement_responses[Math.floor(Math.random() * @decrement_responses.length)]

  get: (thing) ->
    k = if @cache[thing] then @cache[thing] else 0
    return k

  sort: ->
    s = []
    for key, val of @cache
      s.push({ name: key, karma: val })
    s.sort (a, b) -> b.karma - a.karma
  
  top: (n = 5) ->
    sorted = @sort()
    sorted.slice(0, n)
    
  bottom: (n = 5) ->
    sorted = @sort()
    sorted.slice(-n).reverse()
  
module.exports = (robot) ->
  karma = new Karma robot
  robot.hear /(\S+[^+\s])\+\+(\s|$)/, (msg) ->
    subject = msg.match[1].toLowerCase()
    karma.increment subject
    console.log("Increment Subject: ", subject)
    msg.send "#{subject} #{karma.incrementResponse()} (Karma: #{karma.get(subject)})"
  
  robot.hear /(\S+[^-\s])--(\s|$)/, (msg) ->
    subject = msg.match[1].toLowerCase()
    karma.decrement subject
    msg.send "#{subject} #{karma.decrementResponse()} (Karma: #{karma.get(subject)})"
  
  robot.respond /karma set ?(\S+[^-\s]) (-?\d+)?/i, (msg) ->
    if msg.envelope.user.name == "rstrouse"
      console.log("Matched Message: ", msg.match[2])
      count = msg.match[2]
      subject = msg.match[1].toLowerCase()
      karma.set subject, count
      console.log("Count: ", count)
      msg.send "#{subject} has had its karma set to " + count
    else
      msg.send "https://thumbs.gfycat.com/DisastrousMemorableHorse-size_restricted.gif"
  
  robot.respond /karma empty ?(\S+[^-\s])$/i, (msg) ->
    subject = msg.match[1].toLowerCase()
    karma.kill subject
    msg.send "#{subject} has had its karma scattered to the winds."
  
  robot.respond /karma( best)?$/i, (msg) ->
    verbiage = ["The Best"]
    for item, rank in karma.top()
      verbiage.push "#{rank + 1}. #{item.name} - #{item.karma}"
    msg.send verbiage.join("\n")
      
  robot.respond /karma worst$/i, (msg) ->
    verbiage = ["The Worst"]
    for item, rank in karma.bottom()
      verbiage.push "#{rank + 1}. #{item.name} - #{item.karma}"
    msg.send verbiage.join("\n")
  
  robot.respond /karma (\S+[^-\s])$/i, (msg) ->
    match = msg.match[1].toLowerCase()
    if match != "best" && match != "worst"
      msg.send "\"#{match}\" has #{karma.get(match)} karma."
  
