# Description:
#   Integrating Challonge Web API (http://api.challonge.com/v1)
#   This will allow Slack members to engage with commands to create and update #   tournaments with a shared hx account located on the Challonge website.
#
# Account Info: 
# username: hx_games 
# api-key: zGKM450yxSIJ2LbTu6jQWsWsloZj7zOC0nPlBQR2
# https://username:api-key@api.challonge.com/v1/...
#
# 
#   See api.challonge.com/v1 for more details
#   TOURNAMENT COMMANDS
#   hubot tournament index all
#   hubot tournament index pending
#   hubot tournament index in_progress
#   hubot tournament index ended
#   hubot tournament index single_elimination
#   hubot tournament index double_elimination
#   hubot tournament index round_robin
#   hubot tournament index swiss
#   hubot tournament index created_after
#   hubot tournament index created_before
#   hubot tournament create

module.exports = (robot) ->
  robot.respond /(tournament) list/i, (msg) ->
    api_key = "zGKM450yxSIJ2LbTu6jQWsWsloZj7zOC0nPlBQR2"
    msg.http("https://api.challonge.com/v1/tournaments.json")
      .query(api_key: api_key)
      .get() (err, res, body) ->
        if err
          msg.send "Challonge Broken"
          return

        content = JSON.parse(body)
        names = []
        for t in content
          do (t) ->
            names.push(t.tournament.name + " (ID=" + t.tournament.id + ")" + "\n" + "Game Type: " + t.tournament.game_name + "\n" + "Tournament Type: " + t.tournament.tournament_type.toUpperCase() + "\n" + "Current State: " + t.tournament.state.toUpperCase() + "\n" + "Live Image: " + t.tournament.live_image_url + "\n" + "\n")
        msg.send "Tournament Information" + "\n" + names     



