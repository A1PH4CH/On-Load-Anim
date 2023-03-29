local gif = render.load_image(network.get("https://i.gifer.com/XOsX.gif"))
local alpha= 0
local time = math.floor(globals.realtime) or 0
function loading()
	local screen = render.screen_size()
	if math.floor(globals.realtime) - time > 8 then return end

	if globals.realtime - time > 5 then
		alpha = math.clamp(alpha - 1, 0, 50)
	else
		alpha = math.clamp(alpha + 1, 0, 50)	
	end
	
	render.rect(vector(0, 0), vector(screen.x, screen.y), color(255, 255, 255, alpha))	

	render.texture(gif, vector(screen.x/2.8, screen.y/4), vector(540, 540), color(255, 255, 255, alpha* 5.5))

end
function render_call()
if globals.realtime > 40 then loading() end
end
events.render:set(function() render_call() end)