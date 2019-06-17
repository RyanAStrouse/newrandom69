# Description:
#   Listens for "HEY! its MFBT!" and responds with a poll
#
# Author:
#   rstrouse
#
module.exports = (robot) ->
  robot.hear /(HEY! its MFBT!)/i, (msg) ->
    msg.send "/poll Shall we get beers today? YES :beers: NO :no:"