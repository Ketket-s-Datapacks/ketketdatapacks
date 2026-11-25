# Vanilla container contents start with no pickup delay. Only inspect fresh items at this bench's cell.
execute align xyz as @e[type=minecraft:item,dx=0,dy=0,dz=0,nbt={PickupDelay:0s}] unless data entity @s Thrower run function ketket_furnitures:remover/carpenterbench_menu_drop
execute align xyz run kill @e[type=minecraft:item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:trapped_chest",components:{"minecraft:custom_name":"Carpenter Bench"}}},limit=1]
loot spawn ~ ~ ~ loot ketket_furnitures:carpenterbench
kill @e[type=minecraft:block_display,distance=..0.2,tag=bench]
kill @e[type=minecraft:item_display,distance=..0.2,tag=bench]
kill @s
