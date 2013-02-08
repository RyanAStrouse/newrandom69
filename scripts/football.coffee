
module.exports = (robot) ->

  robot.hear /botx football me/i, (msg) ->
    images = ["http://img.gawkerassets.com/img/180qxb8sm08svgif/original.gif","http://img.gawkerassets.com/img/180rd37tx264ygif/original.gif","http://img.gawkerassets.com/img/1805uzn70kg2bgif/original.gif","http://img.gawkerassets.com/img/17zc1bjh0sfz1gif/original.gif", "http://i.imgur.com/ozNEl.gif", "http://img.gawkerassets.com/img/180u5w5gamhkvjpg/original.jpg","http://assets.sbnation.com/assets/1477157/alex-smith-cat.jpg", "http://assets.sbnation.com/assets/1476551/sanchez-grumpy-cat_medium.jpg", "https://i.chzbgr.com/completestore/12/8/7/Q-tKQvaC4UaITXWAdRLVZA2.gif", "http://img.gawkerassets.com/img/180qn79k8yfgtgif/original.gif","http://img.gawkerassets.com/img/180rvnbop659pgif/original.gif"]

    rnd = Math.floor(Math.random() * images.length)
    msg.send images[rnd]
