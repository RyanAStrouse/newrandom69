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

  validWelcome = [
      'We have a new kid on the block, Hello!'
      'Welcome the newest member to the team!'
      'Thanks for joining us!'
      'Happy to have you here!'
    ]

  module.exports = (robot) ->
    robot.enter (msg) ->
      msg.send {room: 'integration-test'}, msg.random validWelcome