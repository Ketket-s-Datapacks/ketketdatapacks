execute if items entity @s weapon.mainhand minecraft:player_head[minecraft:custom_data~{chair6:1b,warped:1b}] if data entity @s SelectedItem.components."minecraft:profile".properties[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZWMxNGFhNDYyOWMzNjFkNGUxMzJiMzFkNGMyYzhjMmE4YjhmMzVkODNmNTU3ODdlNDAzNjNjZGJmYTJmYmQ2YyJ9fX0="}] run item modify entity @s weapon.mainhand ketket_furnitures:legacy/normalize_warped_rack
data remove storage ketket_furnitures:frame_placement resolved
data modify storage ketket_furnitures:frame_placement item set from entity @s SelectedItem.components."minecraft:custom_data"
execute store success score #known_legacy fc.frame_place run function ketket_furnitures:place/frame/resolve_model
execute if score #known_legacy fc.frame_place matches 1 if data storage ketket_furnitures:frame_placement resolved{wooden:1b} store success score #known_legacy fc.frame_place run function ketket_furnitures:place/frame/resolve_wood
data remove storage ketket_furnitures:frame_placement resolved
data remove storage ketket_furnitures:frame_placement item
execute unless score #known_legacy fc.frame_place matches 1 run return run tellraw @s {"text":"This legacy FurniCraft item could not be identified.","color":"yellow"}
item modify entity @s weapon.mainhand ketket_furnitures:legacy/to_frame
tellraw @s {"text":"FurniCraft item updated.","color":"green"}
