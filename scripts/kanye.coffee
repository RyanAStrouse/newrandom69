module.exports = (robot) ->
  robot.respond /(kanye|kanye )? (.*)/i, (msg) ->
    num = msg.match[3]
    switch num
      when "1"
        msg.send("http://i.imgur.com/9Dql0R1.png")
      when "2"
        msg.send("http://i.imgur.com/MjO4B40.png")
      when "3"
        msg.send("http://i.imgur.com/bhIycOK.png")
      when "4"
        msg.send("http://i.imgur.com/agSCiru.png")
      when "5"
        msg.send("http://i.imgur.com/vZqy3TG.png")
      when "6"
        msg.send("http://i.imgur.com/nBA1XWH.png")
      when "7"
        msg.send("http://i.imgur.com/MSnaide.png")
      when "8"
        msg.send("http://i.imgur.com/3FMnZkj.png")
      when "9"
        msg.send("http://i.imgur.com/cvbcuGJ.png")
      when "10"
        msg.send("http://i.imgur.com/Yme2tO2.png")
      when "scale of kanye to kanye"
        msg.send("http://i.imgur.com/LSH4nza.png")
      else
        msg.send "I need a number between 1 and 10."
