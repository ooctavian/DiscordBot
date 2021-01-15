-- Importing libraries
local discordia = require("discordia")
local client = discordia.Client()
local helpers = require("helpers")
local commands= require("./commands")

local prefix = '!'

client:on("ready", function() -- bot is ready
	print("Logged in as " .. client.user.username)
	client:setGame("Helping other people")
	collectgarbage("collect")
end)

client:on("messageCreate", function(message)
	if message.author.bot then return end
	if helpers.hasPrefix(message.content,prefix) then 
	local command = string.sub(message.content,#prefix+1,message.content:find('%s'))
	command = command:gsub("%s+","")

	-- Run a command if it exists 
	if commands[command] ~= nil then
		commands[command].command(message)
	end
	end 
	if message.content == '<@!'..client.user.id..'>' then
		message:reply('try `'..prefix..'help`')
	end
	collectgarbage("collect")
end)

client:run("Bot " .. io.open('token.txt'):read())

