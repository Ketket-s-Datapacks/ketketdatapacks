execute store result score #bench_drop_age fc.frame_place run data get entity @s Age
execute unless score #bench_drop_age fc.frame_place matches 0..2 run return 0
execute if data entity @s Item{id:"minecraft:item_frame",components:{"minecraft:custom_data":{furniture:1b}}} run return run kill @s
execute if data entity @s Item{id:"minecraft:player_head",components:{"minecraft:custom_data":{furniture:1b}}} run kill @s
