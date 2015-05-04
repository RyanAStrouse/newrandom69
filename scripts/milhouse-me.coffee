# Description:
#   Grabs a picture from actualmilhouse.tumblr.com and sends the URL.
#
# Commands:
#   hubot milhouse (someone) - displays a milhouse picture
#

module.exports = (robot) ->
  robot.respond /milhouse (.*)/i, (msg) ->
    API_KEY = "pYuqaM2AM1tafunqXhoDXcM0KoxPpHCEUV7jkxbQ2ww5w5nUnl"
    msg.http("http://api.tumblr.com/v2/blog/actualmilhouse.tumblr.com/info")
      .query(api_key: API_KEY)
      .get() (err, res, body) ->
        if err
          msg.send "Tumblr says: #{err}"
          return

        content = JSON.parse(body)
        if content.meta.status isnt 200
          msg.send "Tumblr says: #{content.meta.msg}"
          return

        rand = Math.random()
        selection = Math.round(rand * content.response.blog.posts)
        msg.http("http://api.tumblr.com/v2/blog/actualmilhouse.tumblr.com/posts/photo")
          .query(api_key: API_KEY, offset: selection, limit: 1)
          .get() (err, res, body) ->

            if err
              msg.send "Tumblr says: #{err}"
              return

            content = JSON.parse(body)
            if content.meta.status isnt 200
              msg.send "Tumblr says: #{content.meta.msg}"
              return

            msg.send content.response.posts[0].photos[0].alt_sizes[1].url