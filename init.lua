-- Flower Bushes created by LadyK
-- modified by Kristovish
-- License: MIT
local default_mod = minetest.get_modpath("default")
local modpath = minetest.get_modpath("flower_bushes")
local modname = "flower_bushes"
local modstorage = minetest.get_mod_storage()

local S
if minetest.get_modpath("intllib") then
S = intllib.Getter()
else
S = function(s) return s end
end

flower_bushes = {}

-- Asignamos el valor de modpath a la variable path
local path = modpath

dofile(minetest.get_modpath("flower_bushes").."/schems.lua")
dofile(minetest.get_modpath("flower_bushes") .. "/bushes.lua")
dofile(minetest.get_modpath("flower_bushes") .. "/saplings.lua")



