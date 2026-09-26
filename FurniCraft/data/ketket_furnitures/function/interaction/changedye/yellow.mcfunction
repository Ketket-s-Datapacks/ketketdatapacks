
execute positioned ~ ~0.5 ~ as @e[type=block_display,distance=..0.5,tag=carpet] run function ketket_furnitures:internal/block_state/from_storage {storage:"colorholder",path:"color.yellow.carpet"}
execute positioned ~ ~0.5 ~ as @e[type=block_display,distance=..0.5,tag=wool] run function ketket_furnitures:internal/block_state/from_storage {storage:"colorholder",path:"color.yellow.wool"}
execute positioned ~ ~0.5 ~ as @e[type=block_display,distance=..0.5,tag=candle] run function ketket_furnitures:internal/block_state/from_storage {storage:"colorholder",path:"color.yellow.candle"}

execute as @e[type=interaction,sort=nearest,limit=1] at @s run tag @s add yellow