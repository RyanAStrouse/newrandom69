#ping pong ladder
#
# Commands:
# !pong register

module.exports = (robot) ->
    getPongData = () ->
        robot.brain.data.pong ?= {}
        return robot.brain.data.pong

    robot.respond /pong register/i, (msg) ->
        console.log msg.message.user
        pongUser = robot.brain.userForId(msg.message.user.id, { 'name': msg.message.user.name })
        console.log pongUser
        if pongUser.playsPong?
            msg.reply "You are already registered."
        else
            pongUser.playsPong = true
            msg.reply "You are now part of the ping pong ladder!"

    robot.respond /pong challenge @?([a-z\.\-_]+)/i, (msg) ->
        console.log msg.match[1]
        challenger = robot.brain.userForId(msg.message.user.id)
        console.log challenger
        if not challenger
            msg.reply "You gotta register first, pal. Try 'pong register'."
            return

        challengee = robot.brain.user.userForName(msg.match[1])
        console.log challengee
        if not challengee or not challengee.playsPong?
            msg.reply "No such person has registered to play."
            return

        pongData = getPongData()
        console.log pongData
        pongData.challenges ?= []
        pongData.challenges.push { challenger: challenger.id, challengee: challengee.id, time: new Date() }
        msg.reply "Challenge registered!"
