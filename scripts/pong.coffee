# ping pong ladder
#
# !pong register

module.exports = (robot) ->
    robot.respond /!pong register/i, (msg) ->
        msg.send "No!"
