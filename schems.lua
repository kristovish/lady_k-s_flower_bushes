local dpath = minetest.get_modpath("default") .. "/schematics/"


-- Load schematic tables
local path = minetest.get_modpath("flower_bushes") .. "/schematics/"

dofile(path .. "black_bush.lua")
dofile(path .. "blue_bush.lua")
dofile(path .. "brown_bush.lua")
dofile(path .. "cyan_bush.lua")
dofile(path .. "dark_green_bush.lua")
dofile(path .. "dark_grey_bush.lua")
dofile(path .. "green_bush.lua")
dofile(path .. "grey_bush.lua")
dofile(path .. "magenta_bush.lua")
dofile(path .. "orange_bush.lua")
dofile(path .. "pink_bush.lua")
dofile(path .. "red_bush.lua")
dofile(path .. "violet_bush.lua")
dofile(path .. "white_bush.lua")
dofile(path .. "yellow_bush.lua")


--minetest.log(dump(flower_bushes))


--[[

-- helper function
    local add_schem = function(a, b, c, d, e, f, g, h, i, j, k)

        -- if not 1 then biome disabled, don't add
        if g ~= 1 then return end
    
        minetest.register_decoration({
            deco_type = "schematic",
            place_on = a,
            sidelen = 80,
            fill_ratio = b,
            biomes = c,
            y_min = d,
            y_max = e,
            schematic = f,
            flags = "place_center_x, place_center_z",
            replacements = h,
            spawn_by = i,
            num_spawn_by = j,
            rotation = k
        })
    end



-- black bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.blackbush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- blue bush
add_schem({"default:dirt_with_grass"}, 0.001, {"bamboo"}, 1, 100,
	flower_bushes.bluebush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- brown bush
add_schem({"default:dirt_with_grass"}, 0.001, {"bamboo"}, 1, 100,
	flower_bushes.brownbush, default.grassland, nil,
	"default:dirt_with_grass", 6)


-- cyan bush
add_schem({"default:dirt_with_grass"}, 0.001, {"bamboo"}, 1, 100,
	flower_bushes.cyanbush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- dark_green bush
add_schem({"default:dirt_with_grass"}, 0.001, {"bamboo"}, 1, 100,
	flower_bushes.darkgreenbush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- dark_grey bush
add_schem({"default:dirt_with_grass"}, 0.001, {"bamboo"}, 1, 100,
	flower_bushes.darkgreybush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- green bush
add_schem({"default:dirt_with_grass"}, 0.001, {"bamboo"}, 1, 100,
	flower_bushes.greenbush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- grey bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.greybush, default.grassland, nil,
	"default:dirt_with_grass", 6)
    
-- magenta bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.magentabush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- orange bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.orangebush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- pink bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.pinkbush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- red bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.redbush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- violet bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.violetbush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- white bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.whitebush, default.grassland, nil,
	"default:dirt_with_grass", 6)

-- yellow bush
add_schem({"default:dirt_with_grass"}, 0.001, {"grassland"}, 1, 100,
	flower_bushes.yellowbush, default.grassland, nil,
	"default:dirt_with_grass", 6)
]]--


	local saplings = {
		"flower_bushes:black_bush_sapling",
		"flower_bushes:blue_bush_sapling",
		"flower_bushes:brown_bush_sapling",
		"flower_bushes:cyan_bush_sapling",
		"flower_bushes:dark_green_bush_sapling",
		"flower_bushes:dark_grey_bush_sapling",
		"flower_bushes:green_bush_sapling",
		"flower_bushes:grey_bush_sapling",
		"flower_bushes:magenta_bush_sapling",
		"flower_bushes:orange_bush_sapling",
		"flower_bushes:pink_bush_sapling",
		"flower_bushes:red_bush_sapling",
		"flower_bushes:violet_bush_sapling",
		"flower_bushes:white_bush_sapling",
		"flower_bushes:yellow_bush_sapling",
	}
	
-- Establece la semilla aleatoria
math.randomseed(os.time())

-- Selecciona un número aleatorio de saplings
local num_saplings = math.random(1, 3)

-- Crea una tabla para almacenar los saplings seleccionados al azar
local random_saplings = {}

-- Itera sobre la tabla de saplings y selecciona algunos al azar
for i, sapling in ipairs(random_saplings) do
	if math.random() < (num_saplings / #saplings) then
		table.insert(random_saplings, sapling)
	end
end


-- Itera sobre la tabla de saplings seleccionados al azar y registra cada uno como decoración
for i, sapling in ipairs(saplings) do
	if math.random(5) == 1 then
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"default:dirt_with_grass", "default:dirt", "default:dirt_with_coniferous_litter", "default:dirt_with_snow", "default:dirt_with_rainforest_litter", "default:dirt"},
			sidelen = 80,
			fill_ratio = 0.003,
			--[[noise_params = {
				offset = -0.006,
				scale = 0.005,
				spread = {x = 100, y = 100, z = 100},
				seed = 7,
				octaves = 8,
				persist = 0.5
			},]]--
			y_min = 1,
			y_max = 200,
			decoration = sapling,
			spawn_by = "default:water_source"

		})
	end
end