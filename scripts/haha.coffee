# Description:
#  Responds with Boiler Up everytime it hears iu
# i couldn't figure out how to make it only respond when jason says iu 
module.exports = (robot) ->
  robot.hear /(haha)/i, (msg) ->
    msg.send "http://www.controlyourcash.com/wp-content/uploads/2011/09/Nelson-Muntz.jpg"
