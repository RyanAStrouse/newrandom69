# ping pong ladder
#
# !pong register

module.exports = (robot) ->
    getPongData = () ->
        robot.brain.data.pong ?= {}
        return robot.brain.data.pong

    getPongUser = (id) ->
        pong = getPongData()
        pong.users ?= {}
        return pong.users

    robot.respond /pong register/i, (msg) ->
        console.log msg.message.user
        pongUser = robot.brain.userForId(msg.message.user.id, { 'name': msg.message.user.name })
        console.log pongUser
        pongUser.playsPong = true
        msg.reply "You are now part of the ping pong ladder!"
