# Description:
#   Grabs a random picture from snipsons.tumblr.com and posts it.
#
# Commands:
#   hubot simpson me - displays a snipsons.tumblr.com picture
#

module.exports = (robot) ->
  robot.respond /simpson me/i, (msg) ->
    console.log('here')
    api_key = "pYuqaM2AM1tafunqXhoDXcM0KoxPpHCEUV7jkxbQ2ww5w5nUnl"
    msg.http("http://api.tumblr.com/v2/blog/snipsons.tumblr.com/info")
      .query(api_key: api_key)
      .get() (err, res, body) ->
        console.log('get')
        if err
          msg.send "Tumblr says: #{err}"
          return

        content = JSON.parse(body)
        console.log('first response body: ', content)
        if content.meta.status isnt 200
          msg.send "Tumblr says: #{content.meta.msg}"
          return

        rand = Math.random()
        selection = Math.round(rand * content.response.blog.posts)
        console.log('selection: ', selection)
        msg.http("http://api.tumblr.com/v2/blog/snipsons.tumblr.com/posts/photo")
          .query(api_key: api_key, offset: selection, limit: 1)
          .get() (err, res, body) ->

            if err
              msg.send "Tumblr says: #{err}"
              return

            content = JSON.parse(body)
            console.log('second response body: ', content)
            if content.meta.status isnt 200
              msg.send "Tumblr says: #{content.meta.msg}"
              return

            msg.send content.response.posts[0].photos[0].alt_sizes[1].url
