# ping pong ladder
#
# !pong register

module.exports = (robot) ->
    robot.hear /^!pong register$/i, (msg) ->
        msg.reply "You are now part of the ping pong ladder, #{msg.user}!"
