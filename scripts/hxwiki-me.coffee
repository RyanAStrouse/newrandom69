# Description:
#   Queries the public Healthx wiki and returns links to the results.
#
# Commands:
#   hubot hxwiki me (query)
#

module.exports = (robot) ->
  robot.respond /(hxwiki|healthx wiki)( me)? (.*)/i, (msg) ->
  	console.log('command received')
	query = encodeURIComponent(msg.match[3])
	site = 'https://sites.google.com/feeds/content/healthx.com/admin/?q=' + query + '&kind=webpage'
	yql = 'http://query.yahooapis.com/v1/public/yql?q=' + encodeURIComponent('select * from xml where url="' + site + '"') + '&format=xml&callback=?'
	console.log('query: ', query)
	console.log('site: ', site)
	console.log('yql: ', yql)
	# $.getJSON(yql, success);
	msg.http(yql)
	.get() (err, res, body) ->
      data = JSON.parse(body)
      console.log('data: ', data)
      if (data.results[0])
        if typeof callback is 'function'
          callback data, query, msg
        else
          msg.send 'Oops!  Something went wrong :('
          throw new Error('Ultra-failed search!')

	callback = (data, query, msg) ->
	  console.log('reached callback')
	  outputXML = $.parseHTML(data.results[0])
	  $xml = $( outputXML )

	  title = $xml.find("title")

	  link = $xml.find("link[rel|='alternate']")

	  query = decodeURIComponent(query)
	  console.log('callback query: ', query)

	  patt = new RegExp(query, 'gi')
	  display = []
	  showMore = []

	  for i in link
	    if patt.test(title[i].innerText) is true
	      display.push('<a href = ' + link[i].href + '>' + title[i].innerText + '</a>')
	    else if title[i].innerText isnt 'Content'
	      showMore.push('<a href = ' + link[i].href +'>' + title[i].innerText + '</a>')
	  
	    console.log('display: ', display)
	    console.log('showMore:', showMore)
	    if display.length < 1
	      showMore.join('<br />')
	      $('#showMore').hide()
	    else
	      out = html(display.join('<br />') + '<br /><br /><a id = "showMore" href = #>Show More?</a>')
	      console.log('out: ', out)
	      $('#showMore').click ->
	        $('#more').html(showMore.join('<br />'))
	        $(this).hide()
	      msg.send out
