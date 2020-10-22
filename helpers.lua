local helpers = {}
function helpers.hasPrefix(string,prefix)
	if string:find(prefix) then
		return true
	else 
		return false
	end
end
return helpers
