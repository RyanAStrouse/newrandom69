module.exports = (robot) ->
	
	images = [
		"http://i.imgur.com/olKOz.jpg",
		"http://i.imgur.com/gjigU.jpg",
		"https://i.chzbgr.com/maxW500/4963396608/hD36EADC7/",
		"https://i.chzbgr.com/maxW500/4843639808/h8F173E42/",
		"http://static.fjcdn.com/pictures/Macaroni_c0c88c_1956326.jpg",
		"http://troll.me/images/the-most-interesting-man-in-the-world/i-dont-always-eat-but-when-i-do-its-mac-and-cheese.jpg",
		"http://i.qkme.me/Ex.jpg",
		"http://cdn.memegenerator.net/instances/400x/22415084.jpg",
		"http://i.qkme.me/35uvfb.jpg",
		"http://eatathomecooks.com/wp-content/uploads/2009/06/macaroni-and-cheese-done-1024x680.jpg",
		"http://3.bp.blogspot.com/-Ei12ljnl7FQ/Teaqcxs_bLI/AAAAAAAAC6o/o6k8tz_YEDQ/s1600/MacNCheesebanner.jpg",
		"http://4.bp.blogspot.com/-tgkWXRdaQGE/TVQ9eqEkLNI/AAAAAAAAC9g/tfPLLc6y4ec/s1600/Mac+n+Cheese+010.JPG",
		"http://4.bp.blogspot.com/-S5p5kl8jh4o/TsuDs48wZCI/AAAAAAAACPA/zmz8X-jrcTU/s1600/baked-macaroni-and-cheese.jpg",
		"http://www.thatwasvegan.com/wp-content/uploads/2011/12/picture-073.jpg",
		"http://images.lifesambrosia.com/food/large/three-cheese-macaroni-and-cheese.jpg",
		"http://www.endlesssimmer.com/wp-content/uploads/2011/03/lizlemon5.gif",
		"http://24.media.tumblr.com/tumblr_m8sy5oJMGy1rtxvj1o1_250.gif"
	]

	robot.hear /botx mac n cheese me/i, (msg) ->
		rnd = Math.floor(Math.random() * images.length)
	    msg.send images[rnd]