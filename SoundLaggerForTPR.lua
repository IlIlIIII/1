if game.PlaceId ~= 6675127933 then return end
local sounds = { }
local recurse
function recurse(instance)
	if instance:IsA "Sound" then
		sounds[#sounds + 1] = instance
	end 
	for _, child in ipairs (instance:GetChildren()) do
		recurse(child) 
	end 
end 
recurse(game) 
game.DescendantAdded:connect(recurse)
spawn(function()
	game:GetService "RunService".RenderStepped:wait() 
	for _, sound in ipairs (sounds) do 
		sound:Play() 
	end
end)
