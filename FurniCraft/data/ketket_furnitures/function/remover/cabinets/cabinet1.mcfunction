execute if entity @s[tag=break] run return 0
tag @s add break
# Claim all parts before changing blocks so a queued checker cannot drop again.
tag @e[type=block_display,tag=cabinet1,distance=..0.1] add break
execute positioned ~ ~-1 ~ run tag @e[type=interaction,tag=cabinet1,distance=..0.1] add break
setblock ~ ~-1 ~ minecraft:air
setblock ~ ~ ~ minecraft:air destroy
kill @e[type=item,nbt={Item:{id:"minecraft:dropper",count:1}},sort=nearest,limit=1]
loot spawn ~ ~0.2 ~ loot ketket_furnitures:cabinets/cabinet1
kill @e[type=block_display,tag=cabinet1,distance=..0.1]
execute positioned ~ ~-1 ~ run kill @e[type=interaction,distance=..0.1,tag=cabinet1]
