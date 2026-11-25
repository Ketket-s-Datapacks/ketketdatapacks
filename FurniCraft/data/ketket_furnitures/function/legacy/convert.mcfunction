scoreboard players set @s fc.convert 0
execute if items entity @s weapon.mainhand minecraft:player_head[minecraft:custom_data~{furniture:1,carpenterbench:1}] run return run function ketket_furnitures:legacy/convert_bench
execute if items entity @s weapon.mainhand minecraft:player_head[minecraft:custom_data~{furniture:1b}] run return run function ketket_furnitures:legacy/convert_head
tellraw @s {"text":"Hold a legacy FurniCraft item in your main hand.","color":"yellow"}
