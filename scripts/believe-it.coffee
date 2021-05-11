# Description:
#   Listens for
#   "can't believe it",
#   "don't believe it",
#   "won't believe it",
#   "unbelievable"
#   then responds with a .gif
#
# Author:
#   unknown

module.exports = (robot) ->
  robot.hear /(can\'t believe it|don\'t believe it|won\'t believe it|unbelievable)/i, (msg) ->
    msg.send "http://i.imgur.com/l1915.gif"
