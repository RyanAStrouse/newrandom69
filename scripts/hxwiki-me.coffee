# Description:
#   Queries the public Healthx wiki and returns links to the results.
#
# Commands:
#   hubot hxwiki me <query> - returns query results from Hx admin wiki
#

module.exports = (robot) ->
  robot.respond /(hxwiki|healthx wiki)( me)? (.*)/i, (msg) ->

    q = msg.match[3]
    query = encodeURIComponent(q)
    site = 'https://sites.google.com/feeds/content/healthx.com/admin/?q=' + query + '&kind=webpage'
    yql = 'http://query.yahooapis.com/v1/public/yql?q=' + encodeURIComponent('select * from xml where url="' + site + '"') + '&format=json'

    msg.http(yql)
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        data = null

        try
          data = JSON.parse(body)
        catch error
          msg.send "Couldn't parse JSON"
          return

        if data.query.results isnt null
          try
            msg.send 'One moment please...'
            msg.send callback data.query.results.feed, query
            # msg.send 'Did you get all that?'
          catch error
            msg.send 'Oops!  Something went wrong :( ' + error
        else
          msg.send 'Sorry, your query got lost in the tubes!'

callback = (data, query) ->
  title = []
  link = []
  for j of data.entry
    if data.entry[j].title
      title[j] = data.entry[j].title
    else
      title[j] = ''

    for k of data.entry[j].link
      if data.entry[j].link[k].rel is 'alternate'
        link[j] = data.entry[j].link[k].href

  query = decodeURIComponent(query)

  patt = new RegExp(query, 'gi')
  display = []
  showMore = []

  for i of link
    if patt.test(title[i])
      display.push(title[i] + ': ' + link[i] + '<br />')
    else
      showMore.push(title[i] + ': ' + link[i] + '<br />')

  # if display.length < 1
  #   showMore.join('<br />')
  #   $('#showMore').hide()
  # else
  display = display.join(' ')
  showMore = showMore.join(' ')
  out = display.concat(showMore)
    # <a id = "showMore" href = #>Show More?</a>
    # console.log('out: ', out)
    # $('#showMore').click ->
    #  $('#more').html(showMore.join('<br />'))
    #  $(this).hide()

  return out
