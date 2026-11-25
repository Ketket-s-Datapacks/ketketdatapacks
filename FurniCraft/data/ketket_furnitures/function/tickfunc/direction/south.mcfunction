execute as @s[x_rotation=60..90] run summon minecraft:marker ^ ^0.4 ^0 {Tags:["1","fc.legacy_detector","south"]}
execute as @s[x_rotation=60..90] run summon minecraft:marker ^ ^0.4 ^1 {Tags:["2","fc.legacy_detector","south"]}
execute as @s[x_rotation=60..90] run summon minecraft:marker ^ ^0.5 ^2 {Tags:["3","fc.legacy_detector","south"]}
execute as @s[x_rotation=60..90] run summon minecraft:marker ^ ^0.5 ^3 {Tags:["4","fc.legacy_detector","south"]}
execute as @s[x_rotation=60..90] run summon minecraft:marker ^ ^0.6 ^4 {Tags:["5","fc.legacy_detector","south"]}
execute as @s[x_rotation=60..90] run summon minecraft:marker ^ ^0.6 ^5 {Tags:["6","fc.legacy_detector","south"]}

execute as @s[x_rotation=50..60] run summon minecraft:marker ^ ^0.9 ^0 {Tags:["7","fc.legacy_detector","south"]}
execute as @s[x_rotation=50..60] run summon minecraft:marker ^ ^0.9 ^1.2 {Tags:["8","fc.legacy_detector","south"]}
execute as @s[x_rotation=50..60] run summon minecraft:marker ^ ^0.9 ^2.2 {Tags:["9","fc.legacy_detector","south"]}
execute as @s[x_rotation=50..60] run summon minecraft:marker ^ ^0.9 ^3.2 {Tags:["10","fc.legacy_detector","south"]}
execute as @s[x_rotation=50..60] run summon minecraft:marker ^ ^0.9 ^4.2 {Tags:["11","fc.legacy_detector","south"]}
execute as @s[x_rotation=50..60] run summon minecraft:marker ^ ^0.9 ^5.2 {Tags:["12","fc.legacy_detector","south"]}

execute as @s[x_rotation=-50..50] run summon minecraft:marker ^ ^1.5 ^0 {Tags:["13","fc.legacy_detector","south"]}
execute as @s[x_rotation=-50..50] run summon minecraft:marker ^ ^1.5 ^1 {Tags:["14","fc.legacy_detector","south"]}
execute as @s[x_rotation=-50..50] run summon minecraft:marker ^ ^1.8 ^2 {Tags:["15","fc.legacy_detector","south"]}
execute as @s[x_rotation=-50..50] run summon minecraft:marker ^ ^1.8 ^3 {Tags:["16","fc.legacy_detector","south"]}
execute as @s[x_rotation=-50..50] run summon minecraft:marker ^ ^1.9 ^4 {Tags:["17","fc.legacy_detector","south"]}
execute as @s[x_rotation=-50..50] run summon minecraft:marker ^ ^1.9 ^5 {Tags:["18","fc.legacy_detector","south"]}

execute as @s[x_rotation=-60..-50] run summon minecraft:marker ^ ^1.5 ^0 {Tags:["19","fc.legacy_detector","south"]}
execute as @s[x_rotation=-60..-50] run summon minecraft:marker ^ ^1.5 ^1 {Tags:["20","fc.legacy_detector","south"]}
execute as @s[x_rotation=-60..-50] run summon minecraft:marker ^ ^1.6 ^2 {Tags:["21","fc.legacy_detector","south"]}
execute as @s[x_rotation=-60..-50] run summon minecraft:marker ^ ^1.6 ^3 {Tags:["22","fc.legacy_detector","south"]}
execute as @s[x_rotation=-60..-50] run summon minecraft:marker ^ ^1.7 ^4 {Tags:["23","fc.legacy_detector","south"]}
execute as @s[x_rotation=-60..-50] run summon minecraft:marker ^ ^1.7 ^5 {Tags:["24","fc.legacy_detector","south"]}

execute as @s[x_rotation=-90..-60] run summon minecraft:marker ^ ^0.4 ^0 {Tags:["25","fc.legacy_detector","south"]}
execute as @s[x_rotation=-90..-60] run summon minecraft:marker ^ ^0.4 ^1 {Tags:["26","fc.legacy_detector","south"]}
execute as @s[x_rotation=-90..-60] run summon minecraft:marker ^0.2 ^0.5 ^2 {Tags:["27","fc.legacy_detector","south"]}
execute as @s[x_rotation=-90..-60] run summon minecraft:marker ^0.2 ^0.5 ^3 {Tags:["28","fc.legacy_detector","south"]}
execute as @s[x_rotation=-90..-60] run summon minecraft:marker ^0.4 ^0.6 ^4 {Tags:["29","fc.legacy_detector","south"]}
execute as @s[x_rotation=-90..-60] run summon minecraft:marker ^0.4 ^0.6 ^5 {Tags:["30","fc.legacy_detector","south"]}

execute as @e[type=marker,tag=fc.legacy_detector] at @s run function ketket_furnitures:tickfunc/markerfunc
