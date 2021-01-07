local commands = {}
commands['poll'] = require('./poll')
commands['avy'] = require('./avy')
commands['choose'] = require('./choose')
commands['info'] = require('./info')
commands['help'] =
{
	name = 'help',
	description = 'Get list of all the commands and what they do',
	command = function(message)
		local mess = ''
		for  k,v in pairs(commands) do
		 mess = mess .. '`' .. commands[k].name .. '` - ' .. commands[k].description .. '\n'
		end
		message:reply({
			embed = {
				title = "List of commands",
				description = mess,
				color = 0x81a1c1 -- hex color code
			}})

	end

}
return commands
