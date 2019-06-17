# Description:
#   Listens for "HEY! its MFBT!" and responds with a poll message
#
# Author:
#   rstrouse
#
module.exports = (robot) ->
  robot.hear /(HEY! its MFBT!)/i, (msg) ->
    msg.send "Shall we get beers today? YES=:beers: NO=:no:"
