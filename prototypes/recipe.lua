local hasDlcQuality = data.raw['recipe']["quality-module"]
local hasDlcSpaceAge = data.raw['recipe']["electromagnetic-plant"]

local godEasierCraft = settings.startup['egm-god-module-easier-craft'].value
local godHasQuality = settings.startup['egm-god-module-use-quality'].value
local recipeRequireQuality = settings.startup['egm-god-module-recipe-require-quality'].value

local t_level = 3

if godEasierCraft then
	t_level = 2
end

local function getGodModuleRecipe(useQuality)
	local ingredients =
	{
		{ type = "item", name = "egm-god-module-speed", amount = 1 },
		{ type = "item", name = "egm-god-module-efficiency", amount = 1 },
		{ type = "item", name = "egm-god-module-productivity", amount = 1 },
	}

	if hasDlcQuality and useQuality and recipeRequireQuality then
		table.insert(ingredients, { type = "item", name = "egm-god-module-quality", amount = 1 })
	end
	
	table.insert(ingredients, { type = "fluid", name = "water", amount = 9000 })

	return ingredients
end

local function getGodModuleNoProdRecipe()
	local ingredients =
	{
		{ type = "item", name = "egm-god-module-speed", amount = 1 },
		{ type = "item", name = "egm-god-module-efficiency", amount = 1 },
	}

	if hasDlcQuality and recipeRequireQuality then
		table.insert(ingredients, { type = "item", name = "egm-god-module-quality", amount = 1 })
	end
	
	table.insert(ingredients, { type = "fluid", name = "water", amount = 9000 })

	return ingredients
end

data:extend({
	{
		type = "recipe",
		name = "egm-god-module",
		enabled = false,
		category = "crafting-with-fluid",
		ingredients = getGodModuleRecipe(godHasQuality),
		energy_required = 120,
		results = { 
			{ type = "item", name = "egm-god-module", amount = 1 }
		}
	},

	{
		type = "recipe",
		name = "egm-god-module-no-prod",
		enabled = false,
		category = "crafting-with-fluid",
		ingredients =
		{
			{ type = "item", name = "egm-god-module-speed", amount = 1 },
			{ type = "item", name = "egm-god-module-efficiency", amount = 1 },
			{ type = "fluid", name = "water", amount = 9000 }
		},
		energy_required = 120,
		results = { 
			{ type = "item", name = "egm-god-module-no-prod", amount = 1 }
		}
	},

	{
		type = "recipe",
		name = "egm-god-module-speed",
		enabled = false,
		category = "crafting-with-fluid",
		ingredients =
		{
			{ type = "item", name = "speed-module-" .. t_level, amount = 3 },
			{ type = "fluid", name = "water", amount = 3000 }
		},
		energy_required = 120,
		results = { 
			{ type = "item", name = "egm-god-module-speed", amount = 1 }
		}
	},

	{
		type = "recipe",
		name = "egm-god-module-efficiency",
		enabled = false,
		category = "crafting-with-fluid",
		ingredients =
		{
			{type = "item", name = "efficiency-module-" .. t_level, amount = 3 },
			{type = "fluid", name = "water", amount = 3000 }
		},
		energy_required = 120,
		results = { 
			{ type = "item", name = "egm-god-module-efficiency", amount = 1 }
		}
	},

	{
		type = "recipe",
		name = "egm-god-module-productivity",
		enabled = false,
		category = "crafting-with-fluid",
		ingredients =
		{
			{ type = "item", name = "productivity-module-" .. t_level, amount = 3 },
	      	{ type = "fluid", name = "water", amount = 3000 }
		},
		energy_required = 120,
		results = { 
            { type = "item", name = "egm-god-module-productivity", amount = 1 }
        }
	}
})

if hasDlcQuality then
	data:extend(
	{
		{
			type = "recipe",
			name = "egm-god-module-quality",
			enabled = false,
			category = "crafting-with-fluid",
			ingredients =
			{
				{ type = "item", name = "quality-module-" .. t_level, amount = 3 },
				{ type = "fluid", name = "water", amount = 3000 }
			},
			energy_required = 120,
			results = { 
				{ type = "item", name = "egm-god-module-quality", amount = 1 }
			}
		}
	})

	if not godHasQuality then
		data:extend(
		{
			{
				type = "recipe",
				name = "egm-god-module-has-quality",
				enabled = false,
				category = "crafting-with-fluid",
				ingredients = getGodModuleRecipe(true),
				energy_required = 120,
				results = { 
					{ type = "item", name = "egm-god-module-has-quality", amount = 1 }
				}
			},
			{
				type = "recipe",
				name = "egm-god-module-no-prod-has-quality",
				enabled = false,
				category = "crafting-with-fluid",
				ingredients = getGodModuleNoProdRecipe(),
				energy_required = 120,
				results = { 
					{ type = "item", name = "egm-god-module-no-prod-has-quality", amount = 1 }
				}
			}
		})
	end

	if hasDlcSpaceAge then
		data.raw['recipe']['egm-god-module'].category = "electronics"
		data.raw['recipe']['egm-god-module-no-prod'].category = "electronics"
		data.raw['recipe']['egm-god-module-speed'].category = "electronics"
		data.raw['recipe']['egm-god-module-efficiency'].category = "electronics"
		data.raw['recipe']['egm-god-module-productivity'].category = "electronics"
		data.raw['recipe']['egm-god-module-quality'].category = "electronics"

		if not godHasQuality then
			data.raw['recipe']['egm-god-module-has-quality'].category = "electronics"
			data.raw['recipe']['egm-god-module-no-prod-has-quality'].category = "electronics"
		end
	end
end