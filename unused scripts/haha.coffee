# Description:
#  Responds with Boiler Up everytime it hears iu
# i couldn't figure out how to make it only respond when jason says iu 
 module.exports = (robot) ->
  robot.hear /(haha)/i, (msg) ->
    msg.send "http://images3.wikia.nocookie.net/__cb62426/simpsons/images/thumb/e/e9/Nelson_Ha-Ha.jpg/100px-15,389,0,373-Nelson_Ha-Ha.jpg"
