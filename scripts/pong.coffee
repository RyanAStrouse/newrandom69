# ping pong ladder
#
# !pong register

module.exports = (robot) ->
    pong = () ->
        robot.brain.data.pong ?= {}
        return robot.brain.data.pong

    robot.hear /^!pong register$/i, (msg) ->
        msg.reply "You are now part of the ping pong ladder, #{msg.message.user}!"
