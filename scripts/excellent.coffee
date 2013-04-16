# Description:
#  Responds with Boiler Up everytime it hears iu
# i couldn't figure out how to make it only respond when jason says iu 
module.exports = (robot) ->
  robot.hear /(Excellent!)/i, (msg) ->
    msg.send "http://1.bp.blogspot.com/-bPuVbSYqEwM/TwQyXlvRrEI/AAAAAAAAAsY/qKc5aBuSUHA/s1600/mr-burns-evil-laugh.png"
