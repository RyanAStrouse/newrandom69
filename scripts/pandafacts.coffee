# Description:
#   Retrieves random panda facts.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot panda fact - Reply back with random panda fact.
#
# Author:
#   chartman & rstrouse


module.exports = (robot) ->

    facts = [
         "While a giant panda is resting, it continues to defecate.",
         "A wild giant panda's diet is almost exclusively (99 percent) bamboo",
         "A group of pandas is known as a cupboard",
         "Pandas were frequently used as background extras in classic black and white films",
         "The eyespots of a giant panda cub are initially in the shape of a circle. As the cub grows, the circles become shaped like a teardrop",
         "Pandas have been a symbol of peace in China. For example, hundreds of years ago, warring tribes in China would raise a flag with a picture of a panda on it to stop a battle or call a truce",
         "According to legend, the panda was once an all-white bear. When a small girl tried to save a panda cub from being attacked by a leopard, the leopard killed the girl instead. Pandas came to her funeral wearing armbands of black ashes. As they wiped their eyes, hugged each other, and covered the ears, they smudged the black ashes.",
         "Pandas are pigeon-toed; in other words, they walk with their front paws turned inward.",
         "The Chinese call giant pandas Yaoguai or “large bear cat.” Pandas have also been known as “beast of prey,” “white leopard,” “iron eating beast,” and “bamboo bear."",
         "More than half of newborn pandas die from diseases or from being accidentally crushed by their mothers.",
         "A panda mother is 900 times bigger than her newborn cub, which weighs less than 5 oz. In comparison, an 8-pound human baby would have a mother that weighed 7,200 pounds.",
         "A panda’s throat has a special lining to protect it from bamboo splinters.",
         "Pandas are older than dinosaurs, appearing in fossil records 500 million years ago.",
         "You can’t make a pet of them as they are very possessive and will mark their owner with urine or bite any stranger.",
         "Their multileveled burrows can have several chambers and as many as 15 entrances and exits. During daytime, pandas reach the topmost level to stretch out in the sun while at night, they move deeper to shield themselves.",
         "They are known to have the largest eyes of any mammal compared to their body size. Each eye is actually heavier than it's brain.",
         "The black & white pattern of their coats is a good bug repellent, keeping horseflies and other blood-suckers at bay.",
         "While eccentric zoologist Lionel Walter Rothschild was able to train pandas to draw his carriage through London, he knew that pandas would be unsuitable for riding and further domestication.",
         "Soviet scientists assumed that a wild panda would have already learned to endure harsh conditions of hunger and cold temperatures. Laika and two other pandas were trained for space travel by being kept in small cages and learning to eat a nutritious gel that would be their food in space.",
         "Pandas glows greenish-yellow under black light",
         "When danger struck, some pandas ball themselves up like pill bugs, with their rear end flexed under their head. Specimens dating as far back as the late Cambrian have been found in this defensive position.",
         "Pandas have large compound eyes made up of hundreds of tiny lenses.",
         "Female pandas have smaller claws than male pandas.",
         "Pandas hatch as tiny larvae, just the size of the head of a pin. Panda larvae float for several weeks before settling to the ocean floor to hatch."
    ]

	robot.respond /panda fact/i, (msg) ->
		randIndex = Math.floor((Math.random()*facts.length)+1)
		msg.send facts[randIndex - 1]
				
				
