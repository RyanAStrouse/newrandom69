# Description:
#  Responds with Boiler Up everytime it hears iu
# i couldn't figure out how to make it only respond when jason says iu 
module.exports = (robot) ->
  robot.hear /(doh!|d\'oh!)/i, (msg) ->
    msg.send "http://blog.shaleshockmedia.org/wp-content/uploads/2013/01/homer_doh1.png"
