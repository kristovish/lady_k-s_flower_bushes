--[[--Bush Steam
minetest.register_node("flower_bushes:bush_steam", {
	description = "Bush Steam",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"flower_bushes_stem.png"},
	inventory_image = "flower_bushes_stem.png",
	wield_image = "flower_bushes_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	--walkable = false,
	groups = {snappy = 3, attached_node = 1, flammable = 3, not_in_creative_inventory = 0},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-5 / 9, -0.5, -5 / 9, 5 / 9, 0.5, 5 / 9},
	},
})]]--



-- Bush Leaves
minetest.register_node('flower_bushes:bush_leaves', {
    description = ('Flower Bush Leaves'),
    drawtype = "allfaces_optional",
    waving = 1,
    tiles = {'flower_bushes_bush_leaves.png'},
    paramtype = "light",
    --walkable = false,
    groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1 },
    drop = {
    max_items = 1,
    items = {
    {items = {'flower_bushes:bush_leaves'}}
    }
    },
    })
    
    
-- Flower Bushes
local flower_bushes_table = {
	{name = 'black', desc = 'Black Flower Bush', tiles = 'black'},
	{name = 'dark_grey', desc = 'Dark Grey Flower Bush', tiles = 'dark_grey'},
	{name = 'grey', desc = 'Grey Flower Bush', tiles = 'grey'},
	{name = 'white', desc = 'White Flower Bush', tiles = 'white'},
	{name = 'brown', desc = 'Brown Flower Bush', tiles = 'brown'},
	{name = 'pink', desc = 'Pink Flower Bush', tiles = 'pink'},
	{name = 'red', desc = 'Red Flower Bush', tiles = 'red'},
	{name = 'orange', desc = 'Orange Flower Bush', tiles = 'orange'},
	{name = 'yellow', desc = 'Yellow Flower Bush', tiles = 'yellow'},
	{name = 'green', desc = 'Green Flower Bush', tiles = 'green'},
	{name = 'dark_green', desc = 'Dark Green Flower Bush', tiles = 'dark_green'},
	{name = 'cyan', desc = 'Cyan Flower Bush', tiles = 'cyan'},
	{name = 'blue', desc = 'Blue Flower Bush', tiles = 'blue'},
	{name = 'violet', desc = 'Violet Flower Bush', tiles = 'violet'},
	{name = 'magenta', desc = 'Magenta Flower Bush', tiles = 'magenta'}
}

for _, data in pairs(flower_bushes_table) do
	minetest.register_node('flower_bushes:' ..data.name.. '_flower_bush', {
		description = data.desc,
		drawtype = 'allfaces_optional',
		waving = 1,
		tiles = {'flower_bushes_bush_leaves.png^(flower_bushes_shadows.png^flower_bushes_' ..data.tiles.. '_flowers.png)'},
		paramtype = 'light',
		--walkable = false,
		groups = {snappy = 3, flammable = 2, dig_immediate = 3, hedge = 1, not_in_creative_inventory = 0},
		drop = {
			max_items = 1,
			items = {
				{items = {'flower_bushes:' ..data.name.. '_bush_sapling'}, rarity = 5},
				{items = {'flower_bushes:' ..data.name.. '_flower'}}
			}
		},
        sounds = default.node_sound_leaves_defaults(),
        node_dig_prediction = 'flower_bushes:bush_leaves',
    
        after_dig_node = function(pos, oldnode, oldmetadata, digger)
            minetest.set_node(pos, {name = 'flower_bushes:bush_leaves'})
            minetest.get_node_timer(pos):start(math.random(500, 2000))
        end,
		
    })
end


for i, flower in ipairs(flower_bushes_table) do
    minetest.register_craftitem('flower_bushes:' .. flower.name .. '_flower', {
        description = flower.desc .. ' Flower',
        inventory_image = 'flower_bushes_' .. flower.tiles .. '_flowers.png',
        groups = {flower = 1},
    })
end





--Flowers into dyes

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:black',
	recipe = {'flower_bushes:black_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:dark_grey',
	recipe = {'flower_bushes:dark_grey_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:grey',
	recipe = {'flower_bushes:grey_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:white',
	recipe = {'flower_bushes:white_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:brown',
	recipe = {'flower_bushes:brown_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:pink',
	recipe = {'flower_bushes:pink_flower'},
})
minetest.register_craft({
	type = 'shapeless',
	output = 'dye:red',
	recipe = {'flower_bushes:red_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:orange',
	recipe = {'flower_bushes:orange_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:yellow',
	recipe = {'flower_bushes:yellow_flower'},
})
minetest.register_craft({
	type = 'shapeless',
	output = 'dye:green',
	recipe = {'flower_bushes:green_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:dark_green',
	recipe = {'flower_bushes:dark_green_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:cyan',
	recipe = {'flower_bushes:cyan_flower'},
})
minetest.register_craft({
	type = 'shapeless',
	output = 'dye:blue',
	recipe = {'flower_bushes:blue_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:violet',
	recipe = {'flower_bushes:violet_flower'},
})

minetest.register_craft({
	type = 'shapeless',
	output = 'dye:magenta',
	recipe = {'flower_bushes:magenta_flower'},
})



--flowers + leaves = flower_bush

for _, data in pairs(flower_bushes_table) do
	minetest.register_craft({
	  type = "shapeless",
	  output = 'flower_bushes:' ..data.name.. '_flower_bush',
	  recipe = {'flower_bushes:bush_leaves', 'flower_bushes:' .. data.name .. '_flower'},
	})
  end



--hedges compatibility
	
if minetest.get_modpath("hedges") then

	for _, data in pairs(flower_bushes_table) do
		hedges.register_hedge('flower_bushes:' .. data.name .. '_flower_bush_hedge', {
			description = data.desc..' hedge',
			texture = 'flower_bushes_bush_leaves.png^flower_bushes_shadows.png^flower_bushes_' ..data.tiles.. '_flowers.png',
			material = 'flower_bushes:' .. data.name .. '_flower_bush',
			groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1},
			sounds = default.node_sound_leaves_defaults(),
			light_source = 0
		})
	end
	
	-- Registra también el bush leaves común como un hedge
	hedges.register_hedge('flower_bushes:bush_leaves_hedge', {
		description = ('Flower Bush Leaves hedge'),
		texture = 'flower_bushes_bush_leaves.png',
		material = 'flower_bushes:bush_leaves',
		groups = {snappy = 3, flammable = 2, leaves = 1, hedge = 1},
		sounds = default.node_sound_leaves_defaults(),
		light_source = 0
	})


end


