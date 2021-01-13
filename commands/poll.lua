local discordia = require("discordia")
local helpers = require("helpers")
return {

	name = "Poll",
	description = "Make a poll out of arguments",
	command = function (message)
	local args = {}
	local text = message.content
	local emojis = {'1️⃣' ,'2️⃣','3️⃣','4️⃣','5️⃣','6️⃣','7️⃣','8️⃣','9️⃣','🔟'}
	text = helpers.removeFirstWord(text)
	if text then
	text = text:sub(text:find('"')+1,#text-1)
       	args = discordia.extensions.string.split(text,'" "')
	local user = message.mentionedUsers.first or message.author
	local title = args[1]
	table.remove(args,1)
	local mess  = ''
	for i=1,#args do 
	mess  = mess .. emojis[i] .. ' - ' .. args[i] .. '\n'
	end

	if #args  then
	    reply = message:reply({
		    embed = {
				title = title,
				description = mess,
			footer = {
				text = "Created by " .. message.author.name
				},
				color = 0xebcb8b -- hex color code

			}})
	    for i=1,#args do
		    reply:addReaction(emojis[i])
	    end
	else
		message:reply("Please supply arguments")
	end
	end
	end
}
