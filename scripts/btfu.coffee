# Description:
#  Responds with Boiler Up everytime it hears iu
# i couldn't figure out how to make it only respond when jason says iu 
module.exports = (robot) ->
  robot.hear /(Hoosiers)/i, (msg) ->
    msg.send "Boiler Up!"