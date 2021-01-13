return {
	name = "Avy",
	description = "Make a poll out of arguments",
	command = function(message)
	local user = message.mentionedUsers.first or message.author
	local embed = {
		title = user.name .. "'s avatar"
	}
	message:reply ({
			embed = {
				title = user.name.."'s avatar",
				image = {
					url = user.avatarURL
				},
				footer = {
					text = "Requested by " .. message.author.name
				},
				color = 0xbf616a -- hex color code
			}
		})
	end
}

