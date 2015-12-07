# Description:
#  Responds with Boiler Up everytime it hears iu
# i couldn't figure out how to make it only respond when jason says iu 
module.exports = (robot) ->
  robot.hear /(doh!|d\'oh!)/i, (msg) ->
    msg.send "https://files.slack.com/files-pri/T024FGTV0-F0G3DU7RV/1333139688_homer_doh.png"
