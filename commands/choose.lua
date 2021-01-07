local discordia = require("discordia")
local helpers = require("helpers")
return {
	name = 'choose',
	description = 'Bless RNG',
	command = function(message)
	local args = {}
	local text = message.content
	text = helpers.removeFirstWord(text)
       	args = discordia.extensions.string.split(text,"or")
	if #args then
		local choosen = args[math.random(#args)]
		choosen = discordia.extensions.string.trim(choosen)
		choosen = choosen:gsub("^%l", string.upper)
		print(choosen..'.')
	else
		message:reply('Supply arguments')
	end
	end
}
