local hasDlcQuality = data.raw['recipe']["quality-module"]
local godEasierCraft = settings.startup['egm-god-module-easier-craft'].value
local godHasQuality = settings.startup['egm-god-module-use-quality'].value
local t_level = 3

if godEasierCraft then
	t_level = 2
end

local effects = {
	{
		type = "unlock-recipe",
		recipe = "egm-god-module"
	},
	{
		type = "unlock-recipe",
		recipe = "egm-god-module-no-prod"
	},
	{
		type = "unlock-recipe",
		recipe = "egm-god-module-speed"
	},
	{
		type = "unlock-recipe",
		recipe = "egm-god-module-efficiency"
	},
	{
		type = "unlock-recipe",
		recipe = "egm-god-module-productivity"
	}
}


if hasDlcQuality then
	
	table.insert(effects, {
		type = "unlock-recipe",
		recipe = "egm-god-module-quality"
	})

	if not godHasQuality then
		table.insert(effects, 2, {
			type = "unlock-recipe",
			recipe = "egm-god-module-has-quality"
		})
		
		table.insert(effects, 4, {
			type = "unlock-recipe",
			recipe = "egm-god-module-no-prod-has-quality"
		})
	end
end

data:extend({
	{
	    type = "technology",
	    name = "egm-god-module",
	    icon = "__rlceasy-god-module__/graphics/technology/god-module.png",
		icon_size = 256,
		effects = effects,
		icon_size = 256,
	    prerequisites = {"speed-module-" .. t_level, "efficiency-module-" .. t_level, "productivity-module-" .. t_level},
	    unit =
	    {
      		count = 300,
      		ingredients =
      		{
		        {"automation-science-pack", 1},
		        {"logistic-science-pack", 1},
		        {"military-science-pack", 1},
		        {"chemical-science-pack", 1},
		        {"production-science-pack", 1},
        		{"utility-science-pack", 1}
      		},
      		time = 60
	    },
	    upgrade = true,
	    order = "i-c-d"
	},	
})