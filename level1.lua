local utils = require("utils")
local player = require("player")
local lime = require("lime.lime"); lime.enableDebugMode()
local physics = require("physics"); physics.start()

local storyboard = require("storyboard")
local scene = storyboard.newScene()

local screenW, screenH = display.contentWidth, display.contentHeight
local map



function scene:createScene(event)
	utils:log("createScene")
	map = lime.loadMap("tilemap.tmx")
	map:addObjectListener("SpawnPlayer", function(object) player:SpawnPlayer(object) end)
	lime.createVisual(map)
	map:setScale(2,2)
	map.world:insert(player.sprite)
end

function scene:enterScene(event)
	utils:log("enterScene")
	lime.buildPhysical(map)
	physics.addBody(player.sprite, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.4, isSensor = false})
	player.sprite:setLinearVelocity(150,0)
    Runtime:addEventListener("enterFrame", enterFrame)
end

function enterFrame(event)
	utils:log("enterFrame");
	local worldX, worldY = map:getPosition()
	local playerX, playerY = player:getPosition()
	print("A:" .. worldY)
	print("B:" .. screenH)
	map:setPosition(playerX*2, playerY*2)
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)


return scene