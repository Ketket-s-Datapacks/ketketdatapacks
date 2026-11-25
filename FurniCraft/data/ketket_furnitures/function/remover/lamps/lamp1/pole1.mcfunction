
# Remove this pole's mount, then update the remaining lamp or pole above it.
execute positioned ~ ~1 ~ run kill @e[type=minecraft:item_display,tag=baseplate,tag=poleblock,tag=!main,distance=..0.15]
execute positioned ~ ~1 ~ run function ketket_furnitures:lamps/refresh_mount
execute align xyz as @e[type=minecraft:item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:iron_chain",count:1}}] unless data entity @s Thrower run kill @s
execute as @s[tag=dropitem] run loot spawn ~ ~0.53 ~ loot ketket_furnitures:lamps/pole1
