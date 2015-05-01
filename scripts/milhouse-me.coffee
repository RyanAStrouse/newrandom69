# Description:
#   Grabs a picture tagged 'milhouse' from tumblr.com and posts it.
#
# Commands:
#   hubot milhouse me - displays a milhouse picture
#

randomDate = (start, end) ->
    new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()))

module.exports = (robot) ->
  robot.respond /(milhouse) me/i, (msg) ->
    api_key = "pYuqaM2AM1tafunqXhoDXcM0KoxPpHCEUV7jkxbQ2ww5w5nUnl"
    msg.http("http://api.tumblr.com/v2/tagged")
      .query(api_key: api_key, tag: 'milhouse', before: randomDate(new Date(2012, 0, 1), new Date()))
      .get() (err, res, body) ->
        if err
          msg.send "Tumblr says: #{err}"
          return

        content = JSON.parse(body)
        if content.meta.status isnt 200
          msg.send "Tumblr says: #{content.meta.msg}"
          return
        pics = []
        response = content.response
        i = 0
        while i < response.length
          if response[i].type == 'photo'
            pics.push(response[i].photos[0])
          i++

        rand = Math.random()
        selection = Math.round(rand * pics.length)
        if typeof pics[selection] isnt 'undefined'
          pic = pics[selection].original_size.url
          msg.send pic
          return
        else
          msg.send 'Oops, something went wrong :('
          return
