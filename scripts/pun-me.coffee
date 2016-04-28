# Description:
#   Get a random pun from punoftheday.com
#
# Commands:
#   hubot pun (someone) - posts a pun
#

Select     = require("soupselect").select
HTMLParser = require "htmlparser"

module.exports = (robot) ->
  robot.respond /pun (.*)/i, (msg) ->
    msg.http("http://www.punoftheday.com/cgi-bin/randompun.pl")
      .get() (err, res, body) ->

        if err
          msg.send "No pun for you! #{err}"
          return
        punElement = parseHTML(body, "div.dropshadow1 p")
        msg.send punElement[0].children[0].raw

parseHTML = (html, selector) ->
  handler = new HTMLParser.DefaultHandler((() ->),
    ignoreWhitespace: true
  )
  parser  = new HTMLParser.Parser handler
  parser.parseComplete html

  Select handler.dom, selector
