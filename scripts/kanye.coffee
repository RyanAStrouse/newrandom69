module.exports = (robot) ->
  robot.respond /(kanye|kanye )? (.*)/i, (msg) ->
    num = msg.message.text
    msg.send msg.message.text
    switch num
      when "1" then msg.send("http://i.imgur.com/9Dql0R1.png")
      when "2" then msg.send("http://i.imgur.com/MjO4B40.png")
      when "3" then msg.send("http://i.imgur.com/bhIycOK.png")
      when "4" then msg.send("http://i.imgur.com/agSCiru.png")
      when "5" then msg.send("http://i.imgur.com/vZqy3TG.png")
      when "6" then msg.send("http://i.imgur.com/nBA1XWH.png")
      when "7" then msg.send("http://i.imgur.com/MSnaide.png")
      when "8" then msg.send("http://i.imgur.com/3FMnZkj.png")
      when "9" then msg.send("http://i.imgur.com/cvbcuGJ.png")
      when "10" then msg.send("http://i.imgur.com/Yme2tO2.png")
      when "scale of kanye to kanye" then msg.send("http://i.imgur.com/LSH4nza.png")
      else msg.send "I need a number between 1 and 10."