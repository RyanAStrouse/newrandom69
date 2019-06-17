# Description:
#   MFBT
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
# hubot mfbttest
# hubot alerts?
#   
# Author:
#   cgack
#



module.exports = (robot) ->
  checkTime = () ->
    now = new Date()
    month = now.getMonth()
    date = now.getDate()
    hour = now.getHours()
    day = now.getDay()
    min = now.getMinutes()
    # Time is in UTC and no timezone. Adjust for DST.
    if (day == 5 && hour >= 19 && min >= 17 &&
        ((month == 2 && date >= 13) ||  # March 13
        (month > 2 && month < 10) ||    # to
        (month == 10 && date < 6))) ||  # November 6
        day == 5 && hour >= 20 && min >= 17
      robot.messageRoom '#mfbt', 'HEY! its MFBT!'
      robot.hear  HEY! its MFBT!/i, (msg) ->
           msg.send "/poll Shall we get beers today? YES :beers: NO :no:"
      clearInterval intv
      false
  
  intv = setInterval checkTime, 60 * 1000
  false
