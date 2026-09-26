
execute positioned ~ ~0.5 ~ as @e[type=block_display,distance=..0.5,tag=carpet] run function ketket_furnitures:internal/block_state/from_storage {storage:"colorholder",path:"color.magenta.carpet"}
execute positioned ~ ~0.5 ~ as @e[type=block_display,distance=..0.5,tag=wool] run function ketket_furnitures:internal/block_state/from_storage {storage:"colorholder",path:"color.magenta.wool"}
execute positioned ~ ~0.5 ~ as @e[type=block_display,distance=..0.5,tag=candle] run function ketket_furnitures:internal/block_state/from_storage {storage:"colorholder",path:"color.magenta.candle"}

execute as @e[type=interaction,sort=nearest,limit=1] at @s run tag @s add magenta