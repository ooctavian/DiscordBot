local helpers = {}
function helpers.hasPrefix(string,prefix)
	if string:find(prefix) then
		return true
	else 
		return false
	end
end
function helpers.removeFirstWord(string)
	if string:find('%s') then 
	return string:sub(string:find('%s'),#string)
	end
end
helpers.timeInit = os.time()
return helpers
