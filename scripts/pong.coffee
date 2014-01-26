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

    robot.hear /^!pong register$/i, (msg) ->
        console.log msg.message.user
        console.log robot.brain.users
        #puser = getPongUser msg.message.user.id
        msg.reply "You are now part of the ping pong ladder, #{msg.message.user}!"
