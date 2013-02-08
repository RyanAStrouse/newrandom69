# Description:
#   deploy dog launch
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot deploy dog launch
#
# Author:
#   unknown
#

module.exports = (robot) ->

  robot.respond /(deploy dog launch)/i, (msg) ->
    msg.send "http://i1112.photobucket.com/albums/k497/animalsbeingdicks/abd-300.gif"
