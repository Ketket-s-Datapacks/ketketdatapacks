
function ketket_furnitures:tickfunc/sumframe

execute as @s[tag=south] run tag @e[type=marker,tag=sumfurniture,sort=nearest,limit=1,distance=..3] add south
execute as @s[tag=east] run tag @e[type=marker,tag=sumfurniture,sort=nearest,limit=1,distance=..3] add east
execute as @s[tag=west] run tag @e[type=marker,tag=sumfurniture,sort=nearest,limit=1,distance=..3] add west
execute as @s[tag=north] run tag @e[type=marker,tag=sumfurniture,sort=nearest,limit=1,distance=..3] add north


execute at @e[type=marker,tag=sumfurniture,sort=nearest,limit=1,distance=..3] run advancement grant @p[scores={furniture.isPlaced=1..}] only ketket_furnitures:adv_handmade
execute as @e[type=marker,tag=sumfurniture,sort=nearest,limit=1,distance=..3] at @s run function ketket_furnitures:place/gettype

scoreboard players set @p[scores={furniture.isPlaced=1..},distance=..8] furniture.isPlaced 0
kill @s