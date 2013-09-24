# Description:
#   dance on commit images
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listens for commit messages.
#   
# Author:
#   cgack && jscott
#

module.exports = (robot) ->

  robot.hear /pushed.*commit/i, (msg) ->
    images = ["http://media0.giphy.com/media/zQLjk9d31jlMQ/200.gif"]

    msg.send msg.random images
