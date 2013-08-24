# Description:
#   get a random snoop quote
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot snoop lion me
#    idk why
# Author:
#   jscott
#

module.exports = (robot) ->

  robot.respond /(snoop lion)( me)/i, (msg) ->
    quotes = ["Rollin down the street, smokin indo, sippin on gin and juice", "Laid back (with my mind on my money and my money on my mind)", "When the pimps in the crib ma drop it like its hot", "One two three and to the four snoop doggy dogg and Dr.Dre is at the door", "Give me the microphone first so i can bust like a bubble compton and long beach togetha now you know you in trouble","Its kinda hard bein Snoop D-O-double-G ", "Snoop Lion ", "http://gifs.gifbin.com/052011/1306491310_snoop_dogg_last_supper.gif" ]
    msg.send msg.random quotes
