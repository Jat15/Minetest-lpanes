-- lpanes: leaded glass panes --  from xPanes mod by xyz, customized by davedevils, reworked and converted to leaded/stained panes by Britt. Textures by Britt

function pane(node, desc, shade)
	local newrecipe
  --Crafing
  --The Clear, Black, and Grey shades need special handling.
	if shade == "clear" then
		newrecipe = {
						{"default:glass", "default:glass", "default:steel_ingot"},
						{"default:glass", "default:glass", ""}
					}
	elseif shade == "black" or shade == "white" or shade == "grey" or shade == "light_grey" or shade =="dark_grey" then
		newrecipe =	{
						{"default:glass", "default:glass", "default:steel_ingot"},
						{"default:glass", "default:glass", "dye:"..shade}
					}
	else
		newrecipe = {
						{"default:glass", "default:glass", "default:steel_ingot"},
						{"default:glass", "default:glass", "unifieddyes:"..shade}
					}
	end

	xpanes.register_pane("lpanes_pane_"..shade, {
		description = desc,
		textures = {"lpanes_"..shade..".png", "lpanes_"..shade..".png", "lpanes_top.png"},
		inventory_image = "lpanes_"..shade..".png",
		use_texture_alpha = true,
		wield_image = "lpanes_"..shade..".png",
		groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
		sounds = default.node_sound_glass_defaults(),
		recipe = newrecipe,
		}
	)
	
	minetest.override_item("xpanes:lpanes_pane_"..shade.."_flat",
		{
			use_texture_alpha = true,
		}
	)
	
	minetest.override_item("xpanes:lpanes_pane_"..shade,
		{
			use_texture_alpha = true,
		}
	)
  
end


colors = {
	{ "spring", true },
	--{ "black", true},
	{ "blue", true },
	{ "cyan", true },
	{ "green", true },
	{ "lime", true },
	{ "magenta", true },
	{ "orange", true },
	{ "red", true },
	{ "fuchsia", true },
	{ "azure", true },
	{ "violet", true },
	{ "yellow", true },
}

--Do the colors that follow Unified Dye's naming pattern
for i in ipairs(colors) do
	local hue = colors[i][1]
  --    node,   desc, shade
	pane("glass", "Glass Pane "..hue,					hue)
	pane("glass", "Glass Pane Medium "..hue,			"medium_"..hue)
	pane("glass", "Glass Pane Medium "..hue.." s50",	"medium_"..hue.."_s50")
	pane("glass", "Glass Pane Dark "..hue,				"dark_"..hue)
	pane("glass", "Glass Pane Dark "..hue.." s50",		"dark_"..hue.."_s50")
end

--Do the colors that don't follow Unified Dye's naming pattern
pane("glass",   "Glass Pane white",			"white")
pane("glass",   "Glass Pane light grey",	"light_grey")
pane("glass",   "Glass Pane grey",			"grey")
pane("glass",   "Glass Pane dark grey",		"dark_grey")
pane("glass",   "Glass Pane black",			"black")
pane("glass",   "Glass Pane clear",			"clear")

print("[LPanes] Loaded!")
