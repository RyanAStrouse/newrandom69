#
# get a random snoop quote
#    quotes = ["Rollin down the street, smokin indo, sippin on gin and juice", "Laid back (with my mind on my money and my money on my mind)", "When the pimps in the crib ma drop it like its hot"]
#	rnd = Math.floor(Math.random() * quotes.length)
#

module.exports = (robot) ->

  robot.respond /(snoop)( me)/i, (msg) ->
    quotes = ["Rollin down the street, smokin indo, sippin on gin and juice", "Laid back (with my mind on my money and my money on my mind)", "When the pimps in the crib ma drop it like its hot", "One two three and to the four snoop doggy dogg and Dr.Dre is at the door", "Give me the microphone first so i can bust like a bubble compton and long beach togetha now you know you in trouble","Its kinda hard bein Snoop D-O-double-G ", "http://healthx.talkerapp.com/rooms/1821/attachments/13132-tumblr_ljhxqfjwb71qhisruo1_5001.gif" ]
    rnd = Math.floor(Math.random() * quotes.length)
    msg.send quotes[rnd]