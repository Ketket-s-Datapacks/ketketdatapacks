execute if data storage ketket_furnitures:frame_placement resolved.wood run function ketket_furnitures:place/frame/apply_wood with storage ketket_furnitures:frame_placement resolved
execute as @e[tag=justspawn,tag=!fc.frame_existing,distance=0..] run data modify entity @s view_range set value 0.70f
tag @e[tag=justspawn,tag=!fc.frame_existing,distance=0..] remove justspawn
