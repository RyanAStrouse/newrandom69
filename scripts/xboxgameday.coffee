# Description:
#   XBOX Game Day Choice
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot xbox gameday
#   
# Author:
#   rstrouse
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
    if (day == 5 && hour >= 14 && min >= 24 &&
        ((month == 2 && date >= 13) ||  # March 13
        (month > 2 && month < 10) ||    # to
        (month == 10 && date < 6))) ||  # November 6
        day == 5 && hour >= 18 && min >= 17
      robot.messageRoom '#xbox', 'Would you like to play a game? Mon=:xbox: Tues=:soccerball: Wed=:meow-party:Thurs=:meow-knife: Fri=:friday:'
      clearInterval intv
      false
  
  intv = setInterval checkTime, 60 * 1000
  false
