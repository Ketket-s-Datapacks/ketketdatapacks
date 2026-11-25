
# Context is the bottom-center of the lamp or pole block. Mount displays sit one block above it.
function ketket_furnitures:lamps/clear_caps
execute if entity @e[type=minecraft:interaction,tag=lamp1,distance=..0.15] positioned ~ ~1 ~ unless entity @e[type=minecraft:item_display,tag=fc.lamp_stem,distance=..0.15] positioned ~ ~-1 ~ run function ketket_furnitures:lamps/spawn_lamp_stem
# A vanilla chain has no FurniCraft pole display and does not replace the mount.
execute if block ~ ~-1 ~ minecraft:iron_chain positioned ~ ~0.03 ~ if entity @e[type=minecraft:item_display,tag=poleblock,tag=main,distance=..0.15] run return 0
execute if entity @e[type=minecraft:interaction,tag=lamp1,distance=..0.15] run return run function ketket_furnitures:lamps/spawn_lamp_mount
execute if block ~ ~ ~ minecraft:iron_chain positioned ~ ~1.03 ~ if entity @e[type=minecraft:item_display,tag=poleblock,tag=main,distance=..0.15] positioned ~ ~-1.03 ~ run function ketket_furnitures:lamps/spawn_pole_mount
