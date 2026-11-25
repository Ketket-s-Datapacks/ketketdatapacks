execute as @s[tag=cabinet1,type=block_display] at @s if block ~ ~0.99 ~ minecraft:air run return run function ketket_furnitures:removercheck
execute as @s[tag=cabinet1,type=interaction] at @s if block ~ ~1 ~ minecraft:air run return run function ketket_furnitures:removercheck
execute as @s[tag=poleblock,tag=main] at @s unless block ~ ~-0.5 ~ minecraft:iron_chain run return run function ketket_furnitures:removercheck
execute as @s[tag=poleblock,tag=main,tag=!fc.lamp_mount] at @s run function ketket_furnitures:lamps/repair_pole_mount
execute as @s[tag=mailbox] at @s unless block ~ ~ ~ minecraft:player_head unless block ~ ~ ~ minecraft:player_wall_head run return run function ketket_furnitures:remover/mailbox/broken_head
execute as @s[tag=!cabinet1,tag=!poleblock,tag=!mailbox] if block ~ ~ ~ minecraft:air run return run function ketket_furnitures:removercheck
execute as @s[tag=table1,tag=main] unless block ~ ~ ~ minecraft:barrier run return run function ketket_furnitures:remover/tables/table1
