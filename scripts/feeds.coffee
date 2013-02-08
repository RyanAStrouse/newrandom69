# Description:
#   Feed Checker - Reports when your feeds have a new entry. Only works on Talker...
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   
# Author:
#   atoumey
#

NodePie = require("nodepie")
Util = require "util"

messagePostUrl = "http://healthx.talkerapp.com/rooms/2040/messages.json"

rooms = [2040]

# permalink property can be "none", "link", or "comments"
feeds = [
  { 
    prefix: "@"
    url: "http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=healthx"
    permalink: "none"
  }
]

# http://api.twitter.com/1/statuses/user_timeline.rss?screen_name={USERNAME}

fetchFeed = (httpClient, feedInfo) ->
  httpClient.create(feedInfo.url).get() (err, res, body) ->
    if res.statusCode is not 200
      console.log "feeds.coffee: Something's gone awry"
    else
      feed = new NodePie(body)
      try
        feed.init()
        item = feed.getItem(0)
        console.log "#{feedInfo.prefix}: #{feedInfo.lastTitle}"
        console.log "#{feedInfo.prefix}: " + item.getTitle()
        if not feedInfo.lastTitle or item.getTitle() is not feedInfo.lastTitle
          message = feedInfo.prefix + item.getTitle()
          switch feedInfo.permalink
            when "link" then message += ' » ' + item.getPermalink()
            when "comments" then message += ' » ' + item.getComments().html
          for room in rooms
            httpClient.create("http://healthx.talkerapp.com/rooms/" + room + "/messages.json").header('Accept', 'application/json').header('Content-Type', 'application/json').header('X-Talker-Token', 'ab4d213b77d78163762f7f6099a76170f74083d4').post('{"message":"' + message + '"}')
            #msg.send item.getTitle() + ": " + item.getPermalink() + " (" + item.getComments()?.html + ")" for item in items

        feedInfo.lastTitle = item.getTitle()
      catch e
        console.log("feeds.coffee: " + e)

module.exports = (robot) ->
  httpClient = robot.Response::httpClient

  setInterval ->
    for feedInfo in feeds
      fetchFeed(httpClient, feedInfo)
  , 300000
