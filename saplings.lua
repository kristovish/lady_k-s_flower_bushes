-- Register Saplings
local register_sapling = function(name, desc, texture, height, color)
	minetest.register_node(name .. "_sapling", {
		description = desc .. " Bush Sapling",
		drawtype = "plantlike",
		tiles = {texture .. ".png"},
		inventory_image = texture .. ".png",
		wield_image = texture .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {
			snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1, flower_bush = 1
		},
		sounds = default.node_sound_leaves_defaults(),
		grown_height = height,

		on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			if pos then
				-- Obtener el color del sapling
				local sapling_name = itemstack:get_name()
				local color = sapling_name:match("flower_bushes:(%w+)_sapling")
				
				-- Llamar a la función add_schem del sapling correspondiente
				if color then
					flower_bushes[color .. "_bush"].add_schem(pos)
				end
			end
			
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				name .. "_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -1, y = 1, z = -1},
				{x = 1, y = 6, z = 1},
				-- maximum interval of interval
				4)
			return itemstack
		end,

	})
end
	


	

register_sapling("flower_bushes:black_bush", "Black", "flower_bushes_black_sapling", 1, "black")
register_sapling("flower_bushes:blue_bush", "Blue", "flower_bushes_blue_sapling", 1, "blue")
register_sapling("flower_bushes:brown_bush", "Brown", "flower_bushes_brown_sapling", 1, "brown")
register_sapling("flower_bushes:cyan_bush", "Cyan", "flower_bushes_cyan_sapling", 1, "cyan")
register_sapling("flower_bushes:dark_green_bush", "Dark Green", "flower_bushes_dark_green_sapling", 1, "dark Green")
register_sapling("flower_bushes:dark_grey_bush", "Dark Grey", "flower_bushes_dark_grey_sapling", 1, "dark Grey")
register_sapling("flower_bushes:green_bush", "Green", "flower_bushes_green_sapling", 1, "green")
register_sapling("flower_bushes:grey_bush", "Grey", "flower_bushes_grey_sapling", 1, "grey")
register_sapling("flower_bushes:magenta_bush", "Magenta","flower_bushes_magenta_sapling", 1, "magenta")
register_sapling("flower_bushes:orange_bush", "Orange", "flower_bushes_orange_sapling", 1, "orange")
register_sapling("flower_bushes:pink_bush", "Pink", "flower_bushes_pink_sapling", 1, "pink")
register_sapling("flower_bushes:red_bush", "Red", "flower_bushes_red_sapling", 1, "red")
register_sapling("flower_bushes:violet_bush", "Violet", "flower_bushes_violet_sapling", 1, "violet")
register_sapling("flower_bushes:white_bush", "White", "flower_bushes_white_sapling", 1, "white")
register_sapling("flower_bushes:yellow_bush", "Yellow", "flower_bushes_yellow_sapling", 1, "yellow")



local add_bush = function (pos, ofx, ofy, ofz, schem, replace)
	-- check for schematic
	if not schem then
		print (S("Schematic not found"))
		return
	end
	-- remove sapling and place schematic
	minetest.swap_node(pos, {name = "air"})
	minetest.place_schematic(
		{x = pos.x - ofx, y = pos.y - ofy, z = pos.z - ofz},
		schem, 0, replace, false)
end

--local path = minetest.get_modpath("flower_bushes") .. "/schematics/"

-- grow tree functions
function flower_bushes.grow_black_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
		"/schematics/black_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.blackbush)
end

function flower_bushes.grow_blue_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/blue_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.bluebush)
end

function flower_bushes.grow_brown_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/brown_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.brownbush)
end

function flower_bushes.grow_cyan_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/cyan_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.cyanbush)
end

function flower_bushes.grow_dark_green_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/dark_green_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.darkgreenbush)
end

function flower_bushes.grow_dark_grey_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/dark_grey_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.darkgreybush)
end

function flower_bushes.grow_green_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/green_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.greenbush)
end

function flower_bushes.grow_grey_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/grey_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.greybush)
end

function flower_bushes.grow_magenta_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/magenta_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.magentabush)
end

function flower_bushes.grow_orange_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/orange_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.orangebush)
end

function flower_bushes.grow_pink_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/black_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.pinkbush)
end

function flower_bushes.grow_red_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/red_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.redbush)
end

function flower_bushes.grow_violet_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/violet_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.violetbush)
end

function flower_bushes.grow_white_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/white_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.whitebush)
end

function flower_bushes.grow_yellow_bush(pos)
	local path = minetest.get_modpath("flower_bushes") ..
	"/schematics/yellow_bush.lua"
	add_bush(pos, 1, 0, 1, flower_bushes.yellowbush)
end

-- check if sapling has enough height room to grow
local enough_height = function(pos, height)

	local nod = minetest.line_of_sight(
		{x = pos.x, y = pos.y + 1, z = pos.z},
		{x = pos.x, y = pos.y + height, z = pos.z})

	if not nod then
		return false -- obstructed
	else
		return true -- can grow
	end
end



local grow_sapling = function(pos, node)

	local under =  minetest.get_node({
		x = pos.x,
		y = pos.y - 1,
		z = pos.z
	}).name

	if not minetest.registered_nodes[node.name] then
		return
	end

	local height = minetest.registered_nodes[node.name].grown_height

	-- do we have enough height to grow sapling into tree?
	if not height or not enough_height(pos, height) then
		return
	end

    -- Check if bush Sapling is growing on correct substrate
	if node.name == "flower_bushes:black_bush_sapling"
	and minetest.get_item_group(under, "soil") > 0 then
		flower_bushes.grow_black_bush(pos)


	elseif node.name == "flower_bushes:blue_bush_sapling"
	and under == "default:dirt_with_grass" then
		flower_bushes.grow_blue_bush(pos)

	elseif node.name == "flower_bushes:brown_bush_sapling"
	and under == "default:dirt_with_rainforest_litter" then
		flower_bushes.grow_brown_bush(pos)

	elseif node.name == "flower_bushes:cyan_bush_sapling"
	and under == "default:dirt_with_rainforest_litter" then
		flower_bushes.grow_cyan_bush(pos)

	elseif node.name == "flower_bushes:dark_green_bush_sapling"
	and under == "default:dirt_with_snow" then
		flower_bushes.grow_dark_green_bush(pos)

	elseif node.name == "flower_bushes:dark_grey_bush_sapling"
	and under == "default:dirt_with_snow" then
		flower_bushes.grow_dark_grey_bush(pos)

	elseif node.name == "flower_bushes:green_bush_sapling"
	and under == "default:dirt_with_snow" then
		flower_bushes.grow_green_bush(pos)

	elseif node.name == "flower_bushes:grey_bush_sapling"
	and under == "default:dirt_with_dry_grass" then
		flower_bushes.grow_grey_bush(pos)

	elseif node.name == "flower_bushes:magenta_bush_sapling"
	and under == "default:dirt_with_rainforest_litter" then
		flower_bushes.grow_magenta_bush(pos)

	elseif node.name == "flower_bushes:orange_bush_sapling"
	and under == "default:dirt_with_dry_grass" then
		flower_bushes.grow_orange_bush(pos)

	elseif node.name == "flower_bushes:pink_bush_sapling"
	and under == "default:dirt_with_grass" then
		flower_bushes.grow_pink_bush(pos)

	elseif node.name == "flower_bushes:red_bush_sapling"
	and under == "default:dirt_with_coniferous_litter" then
		flower_bushes.grow_red_bush(pos)

	elseif node.name == "flower_bushes:violet_bush_sapling"
	and under == "default:dirt_with_snow" then
		flower_bushes.grow_violet_bush(pos)

	elseif node.name == "flower_bushes:white_bush_sapling"
	and under == "default:dirt" then
		flower_bushes.grow_white_bush(pos)

    elseif node.name == "flower_bushes:yellow_bush_sapling"
	and under == "default:dirt_with_grass" then
		flower_bushes.grow_yellow_bush(pos)

	end
end


minetest.register_abm({
	label = "Grow flower bush sapling",
	nodenames = {"group:flower_bush"},
	interval = 7,
	chance = 1,
	catch_up = false,
	action = function(pos, node)

		local light_level = minetest.get_node_light(pos) or 0

		if light_level < 13 then
			return
		end

		grow_sapling(pos, node)
	end
})




