-- Importing libraries
local discordia = require("discordia")
local client = discordia.Client()
local helpers = require("helpers")
local commands= require("commands.init")
prefix = '!'
client:on("ready", function() -- bot is ready
	print("Logged in as " .. client.user.username)
	client:setGame("Helping other people")
end)

-- Function to run other functions if they are not nil
local function run(func)
if func ~= nil then
	func()
end
end

client:on("messageCreate", function(message)
	if message.author.bot then return end
	if helpers.hasPrefix(message.content,prefix) then 
	local command = string.sub(message.content,#prefix,message.content:find('%s'))
	message:reply("wtf")
	run(wtf)
	end 
end)

client:run("Bot " .. io.open('token.txt'):read())

