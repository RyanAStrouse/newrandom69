# Description:
#   Grabs a random picture from snipsons.tumblr.com and posts it.
#
# Commands:
#   hubot simpson me - displays a snipsons.tumblr.com picture
#

module.exports = (robot) ->
  robot.respond /(simpson me)/i, (msg) ->
    api_key = "pYuqaM2AM1tafunqXhoDXcM0KoxPpHCEUV7jkxbQ2ww5w5nUnl"
    msg.http("http://api.tumblr.com/v2/blog/snipsons.tumblr.com/info")
      .query(api_key: api_key)
      .get() (err, res, body) ->
        if err
          msg.send "Tumblr says: #{err}"
          return

        content = JSON.parse(body)

        if content.meta.status isnt 200
          msg.send "Tumblr says: #{content.meta.msg}"
          return

        rand = Math.random()
        selection = Math.round(rand * content.response.posts)

        msg.http("http://api.tumblr.com/v2/blog/snipsons.tumblr.com/posts/photo")
          .query(api_key: api_key, offset: selection, limit: 1)
          .get() (err, res, body) ->

            if err
              msg.send "Tumblr says: #{err}"
              return

            content = JSON.parse(body)

            if content.meta.status isnt 200
              msg.send "Tumblr says: #{content.meta.msg}"
              return

            post = content.response.posts

            for post in posts
              if posts.length is 1
                msg.send post.caption
              for photo in post.photos
                msg.send photo.original_size.url
