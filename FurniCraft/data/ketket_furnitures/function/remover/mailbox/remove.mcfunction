setblock ~ ~ ~ minecraft:air
execute as @s[tag=dropitem] run loot spawn ~ ~ ~ loot ketket_furnitures:mailbox

playsound minecraft:block.stone.break ambient @a[distance=..10] ~ ~ ~ 3 0
#particle minecraft:block minecraft:furnace ~ ~ ~ .125 .125 .125 0 40

execute at @s run kill @e[type=minecraft:item_display,distance=..0.5,tag=mailstorage]

kill @s
