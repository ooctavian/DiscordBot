local helpers = require('helpers')
return {
	name = 	'info',
	description = 'Get info about the current instance of the bot',
	command = function (message)
		local time = os.time() - helpers.timeInit
		hours = string.format("%1.f", math.floor(time/3600));
		mins = string.format("%1.f", math.floor(time/60 - (hours*60)));
		secs = string.format("%1.f", math.floor(time - hours*3600 - mins *60));
		mb = string.format("%2.2f", collectgarbage("count")/1000)
		local uptime = ''
		if hours ~= '0' then
			uptime = uptime .. hours .. ' hours '
		end
		if mins ~= '0' then
			uptime = uptime .. mins .. ' mins '
		end
		uptime = uptime .. secs .. ' secs ' 
		message:reply({
			embed = {
				title = "Info",
				fields ={
					{
						name = 'Ram usage',
						value = (mb..'MB'),
						inline = true
					},
					{
						name = 'Uptime',
						value = uptime,
						value = true
					}
				},
				color = 0x000000 -- hex color code
			}})

		end
	}
