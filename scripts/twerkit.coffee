# Description:
#   A .gif animation that features a woman "twerking", reflected in the eyes of Homer J. Simpson.
#
# Commands:
#   hubot twerk it - displays the .gif
#

module.exports = (robot) ->
  robot.respond /(twerkit|twerk it)/i, (msg) ->
    msg.send "http://media.tumblr.com/852bfe35d07e44bba3b8a9ee260abd75/tumblr_mu7z3d7E091shz1zgo1_400.gif"
