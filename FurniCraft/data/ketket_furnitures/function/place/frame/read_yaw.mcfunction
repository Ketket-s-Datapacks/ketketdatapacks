scoreboard players set #direction fc.frame_place 0
execute if entity @s[y_rotation=45..135] run scoreboard players set #direction fc.frame_place 1
execute if entity @s[y_rotation=-135..-45] run scoreboard players set #direction fc.frame_place 2
execute if entity @s[y_rotation=135..-135] run scoreboard players set #direction fc.frame_place 3
execute store result score #rotation fc.frame_place run data get entity @s Rotation[0] 1000
scoreboard players add #rotation fc.frame_place 11250
scoreboard players operation #rotation fc.frame_place %= #circle fc.frame_place
scoreboard players operation #rotation fc.frame_place /= #segment fc.frame_place
