execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air unless block ~ ~ ~ minecraft:light[level=13] run return 0
execute if entity @e[type=minecraft:interaction,tag=furniture,distance=..0.95] run return 0
execute if entity @e[type=minecraft:block_display,tag=benchmain,distance=..0.75] run return 0
execute positioned ~ ~1.03 ~ if entity @e[type=minecraft:item_display,tag=poleblock,tag=main,distance=..0.25] run return 0
execute if data storage ketket_furnitures:frame_placement resolved{model:"cabinet1"} positioned ~ ~1 ~ unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air run return 0

# A Street Lamp removed by an older build can leave a light in an otherwise empty cell.
execute if block ~ ~ ~ minecraft:light[level=13] run function ketket_furnitures:lamps/clear_orphan_light

# Keep any pre-existing parts out of the existing material and connection functions.
tag @e[tag=justspawn,distance=0..] add fc.frame_existing
execute summon minecraft:marker run function ketket_furnitures:place/frame/model_context with storage ketket_furnitures:frame_placement resolved
tag @e[tag=fc.frame_existing,distance=0..] remove fc.frame_existing
execute if data storage ketket_furnitures:frame_placement resolved{model:"carpenterbench"} if block ~ ~ ~ minecraft:trapped_chest if entity @e[type=minecraft:block_display,tag=benchmain,distance=..0.75] run return 1
execute if data storage ketket_furnitures:frame_placement resolved{model:"pole1"} if block ~ ~ ~ minecraft:iron_chain positioned ~ ~1.03 ~ if entity @e[type=minecraft:item_display,tag=poleblock,tag=main,distance=..0.25] run return 1
$execute if entity @e[type=minecraft:interaction,tag=$(model),distance=..0.99] run return 1
execute if data storage ketket_furnitures:frame_placement resolved{model:"chair6wooled"} if entity @e[type=minecraft:interaction,tag=chair6,tag=wooled,distance=..0.99] run return 1
return 0
