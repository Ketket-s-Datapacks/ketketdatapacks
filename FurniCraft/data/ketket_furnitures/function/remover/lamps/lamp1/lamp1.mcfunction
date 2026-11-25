
# Display roots are above the interaction and the light block.
execute positioned ~ ~1 ~ run kill @e[type=minecraft:item_display,tag=lamp1,distance=..0.8]
execute positioned ~ ~1 ~ run kill @e[type=minecraft:item_display,tag=baseplate,tag=poleblock,tag=!main,distance=..0.15]
execute as @s[tag=dropitem] run loot spawn ~ ~ ~ loot ketket_furnitures:lamps/lamp1
execute if block ~ ~ ~ minecraft:light[level=13] run setblock ~ ~ ~ minecraft:air
playsound minecraft:block.lantern.break ambient @a[distance=..10] ~ ~ ~ 3 0
