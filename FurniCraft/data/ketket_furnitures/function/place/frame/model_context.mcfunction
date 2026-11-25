tag @s add fc.frame_context
scoreboard players operation #model_direction fc.frame_place = #direction fc.frame_place
execute if data storage ketket_furnitures:frame_placement item{curtain1:1b} run function ketket_furnitures:place/frame/curtain_direction
execute if data storage ketket_furnitures:frame_placement item{curtain2:1b} run function ketket_furnitures:place/frame/curtain_direction
execute if score #model_direction fc.frame_place matches 0 run tag @s add south
execute if score #model_direction fc.frame_place matches 1 run tag @s add west
execute if score #model_direction fc.frame_place matches 2 run tag @s add east
execute if score #model_direction fc.frame_place matches 3 run tag @s add north
execute if data storage ketket_furnitures:frame_placement item{mailbox:1b} run function ketket_furnitures:place/frame/mailbox_head
$function ketket_furnitures:$(place)
execute if entity @s[type=minecraft:marker] run kill @s
