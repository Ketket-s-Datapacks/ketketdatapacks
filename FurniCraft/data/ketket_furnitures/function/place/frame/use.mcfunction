advancement revoke @s only ketket_furnitures:frame_placement/use
# A block-use reward can also run on a rejected vanilla use.
execute store result score #candidates fc.frame_place if entity @e[type=minecraft:item_frame,tag=fc.frame_pending,distance=..7,nbt={data:{furniture:1b}}]
execute if score #candidates fc.frame_place matches 2.. run function ketket_furnitures:place/frame/quarantine
execute unless score #candidates fc.frame_place matches 1 run return 0
function ketket_furnitures:place/frame/read_yaw
execute store result score #placed fc.frame_place as @e[type=minecraft:item_frame,tag=fc.frame_pending,distance=..7,nbt={data:{furniture:1b}},limit=1] run function ketket_furnitures:place/frame/process
execute if score #placed fc.frame_place matches ..-1 run function ketket_furnitures:place/frame/quarantine
execute if score #placed fc.frame_place matches 1 run advancement grant @s only ketket_furnitures:adv_handmade
execute if score #placed fc.frame_place matches 0 unless entity @s[gamemode=creative] run function ketket_furnitures:place/frame/refund with storage ketket_furnitures:frame_placement resolved
data remove storage ketket_furnitures:frame_placement resolved
data remove storage ketket_furnitures:frame_placement item
