# Preserve unexpected contents for inspection.
execute if data entity @s Item run return -1
data remove storage ketket_furnitures:frame_placement resolved
data modify storage ketket_furnitures:frame_placement item set from entity @s data
execute unless function ketket_furnitures:place/frame/resolve_model run return -1
execute if data storage ketket_furnitures:frame_placement resolved{wooden:1b} unless function ketket_furnitures:place/frame/resolve_wood run return -1
execute if data storage ketket_furnitures:frame_placement resolved.wood run function ketket_furnitures:place/frame/resolve_loot with storage ketket_furnitures:frame_placement resolved
tag @s remove fc.frame_pending
data modify storage ketket_furnitures:frame_placement resolved.x set from entity @s block_pos[0]
data modify storage ketket_furnitures:frame_placement resolved.y set from entity @s block_pos[1]
data modify storage ketket_furnitures:frame_placement resolved.z set from entity @s block_pos[2]
execute store result score #face fc.frame_place run data get entity @s Facing
scoreboard players set #model fc.frame_place 0
# Preserve the floor and wall placement rules of the original skull item.
execute if score #face fc.frame_place matches 1..5 store result score #model fc.frame_place run function ketket_furnitures:place/frame/at_anchor with storage ketket_furnitures:frame_placement resolved
kill @s
return run scoreboard players get #model fc.frame_place
