# Description:
#   When a new hire joins Slack they are automatically placed in general channel and this welcomes them!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   rstrouse

class Welcome

  constructor: (@robot) ->
    @valid_welcomes = [
      "is the new kid on the block! Hello!", "is the newest member of the team! Welcome!", "Thanks for joining us, ",
      "Happy to have you here"
    ]

  welcomeresponses: ->
    @valid_welcomes[Math.floor(Math.random)]

  module.exports = (robot) ->
    welcome = new Welcome robot
    robot.hear /joined #integration-test/, (msg) ->
    subject = msg.match[1].toLowerCase()
    msg.send "#{subject} #{welcome.valid_welcomes()}"


