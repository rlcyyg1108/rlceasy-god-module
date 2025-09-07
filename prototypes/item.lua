local item_sounds = require("__base__.prototypes.item_sounds")
local godHasQuality = settings.startup['egm-god-module-use-quality'].value
local hasDlcQuality = data.raw['recipe']["quality-module"]

local moduleColors = {
	blue = { primary = util.color("4baae5"), secondary = util.color("FFFFFF") },
	green = { primary = util.color("84d65b"), secondary = util.color("FFFFFF") },
	purple = { primary = util.color("c26fc2"), secondary = util.color("FFFFFF") }
}

function get_all_effect(useQuality)
	local effects = {
		speed = settings.startup["egm-god-module-speed-bonus"].value / 100,
		consumption = settings.startup["egm-god-module-efficiency-bonus"].value / 100 * -1,
		productivity = settings.startup["egm-god-module-productivity-bonus"].value / 100
	}

	if hasDlcQuality and useQuality then
		effects['quality'] = settings.startup["egm-god-quality-module-quality-bonus"].value / 10
	end

	return effects
end


function get_all_effect_no_prod(useQuality)
	local effects = {
		speed = settings.startup["egm-god-module-speed-bonus"].value / 100,
		consumption = settings.startup["egm-god-module-efficiency-bonus"].value / 100 * -1,
	}

	if hasDlcQuality and useQuality then
		effects['quality'] = settings.startup["egm-god-quality-module-quality-bonus"].value / 10
	end

	return effects
end

function get_speed_effect()
	return {
		speed = settings.startup["egm-god-speed-module-speed-bonus"].value / 100
	}
end

function get_efficiency_effect()
	return {
		consumption = settings.startup["egm-god-efficiency-module-efficiency-bonus"].value / 100 * -1
	}
end

function get_productivity_effect()
	return {
		productivity = settings.startup["egm-god-productivity-module-productivity-bonus"].value / 100
	}
end

function get_quality_effect()
	return {
		quality = settings.startup["egm-god-quality-module-quality-bonus"].value / 10
	}
end



data:extend({
	{
	    type = "module",
	    name = "egm-god-module",
		icon = "__rlceasy-god-module__/graphics/icons/god-module.png",
	    subgroup = "module",
	    category = "egm-god-modules",
	    tier = 1,
	    order = "f[egm-god-module]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
	    default_request_amount = 10,
	    effect = get_all_effect(godHasQuality),
		art_style = "vanilla",
		requires_beacon_alt_mode = false,
	},
	{
	    type = "module",
	    name = "egm-god-module-no-prod",
		icon = "__rlceasy-god-module__/graphics/icons/god-module-no-prod.png",
	    subgroup = "module",
	    category = "egm-god-modules-no-prod",
	    tier = 1,
	    order = "e[egm-god-module]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
	    default_request_amount = 10,
	    effect = get_all_effect_no_prod(godHasQuality),
		beacon_tint = moduleColors.purple,
		art_style = "vanilla",
		requires_beacon_alt_mode = false,
	},

	{
	    type = "module",
	    name = "egm-god-module-speed",
		icon = "__rlceasy-god-module__/graphics/icons/god-module-speed.png",
	    subgroup = "module",
	    category = "speed",
	    tier = 4,
	    order = "a[speed]-d[speed-module-4]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
	    default_request_amount = 10,
	    effect = get_speed_effect(),
		beacon_tint = moduleColors.blue,
		art_style = "vanilla",
		requires_beacon_alt_mode = false,
	},

	{
	    type = "module",
	    name = "egm-god-module-efficiency",
		icon = "__rlceasy-god-module__/graphics/icons/god-module-efficiency.png",
	    subgroup = "module",
	    category = "efficiency",
	    tier = 4,
	    order = "c[efficiency]-d[efficiency-module-4]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
	    default_request_amount = 10,
	    effect = get_efficiency_effect(),
		beacon_tint = moduleColors.green,
		art_style = "vanilla",
		requires_beacon_alt_mode = false,
	},

	{
	    type = "module",
	    name = "egm-god-module-productivity",
		icon = "__rlceasy-god-module__/graphics/icons/god-module-productivity.png",
	    subgroup = "module",
	    category = "productivity",
	    tier = 4,
	    order = "c[productivity]-d[productivity-module-4]",
		inventory_move_sound = item_sounds.module_inventory_move,
		pick_sound = item_sounds.module_inventory_pickup,
		drop_sound = item_sounds.module_inventory_move,
		stack_size = 50,
		weight = 20 * kg,
	    default_request_amount = 10,
	    effect = get_productivity_effect(),
		art_style = "vanilla",
		requires_beacon_alt_mode = false,
    	--limitation = productivitymodulelimitation(),
    	--limitation_message_key = "production-module-usable-only-on-intermediates"
	}
})

if hasDlcQuality then
	if not godHasQuality then
		data:extend({		
			{
				type = "module",
				name = "egm-god-module-has-quality",
				icon = "__rlceasy-god-module__/graphics/icons/god-module-has-quality.png",
				subgroup = "module",
				category = "egm-god-modules-quality",
				tier = 1,
				order = "f[egm-god-module]",
				inventory_move_sound = item_sounds.module_inventory_move,
				pick_sound = item_sounds.module_inventory_pickup,
				drop_sound = item_sounds.module_inventory_move,
				stack_size = 50,
				weight = 20 * kg,
				default_request_amount = 10,
				effect = get_all_effect(true),
				art_style = "vanilla",
				requires_beacon_alt_mode = false,
			},
			{
				type = "module",
				name = "egm-god-module-no-prod-has-quality",
				icon = "__rlceasy-god-module__/graphics/icons/god-module-no-prod-has-quality.png",
				subgroup = "module",
				category = "egm-god-modules-no-prod-quality",
				tier = 1,
				order = "e[egm-god-module]",
				inventory_move_sound = item_sounds.module_inventory_move,
				pick_sound = item_sounds.module_inventory_pickup,
				drop_sound = item_sounds.module_inventory_move,
				stack_size = 50,
				weight = 20 * kg,
				default_request_amount = 10,
				effect = get_all_effect_no_prod(true),
				art_style = "vanilla",
				requires_beacon_alt_mode = false,
			},
		})
	end
	
	data:extend({		
		{
			type = "module",
			name = "egm-god-module-quality",
			icon = "__rlceasy-god-module__/graphics/icons/god-module-quality.png",
			subgroup = "module",
			category = "quality",
			tier = 4,
			order = "d[quality]-d[quality-module-4]",
			inventory_move_sound = item_sounds.module_inventory_move,
			pick_sound = item_sounds.module_inventory_pickup,
			drop_sound = item_sounds.module_inventory_move,
			stack_size = 50,
			weight = 20 * kg,
			default_request_amount = 10,
			effect = get_quality_effect(),
			art_style = "vanilla",
			requires_beacon_alt_mode = false,
		}
	})
end