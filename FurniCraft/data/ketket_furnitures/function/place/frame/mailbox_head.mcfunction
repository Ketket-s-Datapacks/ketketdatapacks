execute store result storage ketket_furnitures:frame_placement resolved.rotation int 1 run scoreboard players get #rotation fc.frame_place
execute if score #face fc.frame_place matches 1 run function ketket_furnitures:place/frame/mailbox_floor with storage ketket_furnitures:frame_placement resolved
execute if score #face fc.frame_place matches 2 run setblock ~ ~ ~ minecraft:player_wall_head[facing=north]
execute if score #face fc.frame_place matches 3 run setblock ~ ~ ~ minecraft:player_wall_head[facing=south]
execute if score #face fc.frame_place matches 4 run setblock ~ ~ ~ minecraft:player_wall_head[facing=west]
execute if score #face fc.frame_place matches 5 run setblock ~ ~ ~ minecraft:player_wall_head[facing=east]
