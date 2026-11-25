advancement revoke @s only ketket_furnitures:frame_placement/legacy_head
scoreboard players set #legacy_placed fc.frame_place 0
function ketket_furnitures:tickfunc/placedetector
execute if score #legacy_placed fc.frame_place matches 1 run advancement grant @s only ketket_furnitures:adv_handmade
