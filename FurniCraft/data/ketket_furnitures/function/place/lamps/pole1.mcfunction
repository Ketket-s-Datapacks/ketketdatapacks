setblock ~ ~ ~ minecraft:iron_chain
summon minecraft:item_display ~ ~1.03 ~ {transformation:[0.270f, 0.000f, 0.000f,0.000f,0.000f, 2.000f, 0.000f,0.000f,0.000f, 0.000f, 0.270f,0.000f,0.000f, 0.000f, 0.000f,1.000f],Tags:["blockchecker","poleblock","furniture","main","fc.lamp_mount"],item:{id:"minecraft:player_head",count:1,components:{profile:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjA4ZjMyMzQ2MmZiNDM0ZTkyOGJkNjcyODYzOGM5NDRlZTNkODEyZTE2MmI5YzZiYTA3MGZjYWM5YmY5In19fQ=="}]}}}}

function ketket_furnitures:lamps/refresh_mount
execute positioned ~ ~1 ~ run function ketket_furnitures:lamps/refresh_mount
kill @s
