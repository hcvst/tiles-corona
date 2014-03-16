local utils = require("utils")
local player = {}

function player:SpawnPlayer(object)
	self.sprite = display.newCircle( object.x, object.y, 10 )
	self.sprite:setFillColor(250, 100, 0)
end

function player:getPosition()
	utils:log("getScreenPosition")
	return self.sprite.x, self.sprite.y
end


return player