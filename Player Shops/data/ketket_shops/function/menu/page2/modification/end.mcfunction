execute as @e[distance=..1,type=text_display] at @s run function ketket_shops:display/writes

function ketket_shops:display/update_items

execute as @s[tag=!messagesended] run playsound minecraft:ui.cartography_table.take_result ambient @p[nbt={Inventory:[{components:{"minecraft:custom_data":{ketket_shop:1b}}}]}] ~ ~ ~ 1 1
execute as @s[tag=!messagesended] run tellraw @p[nbt={Inventory:[{components:{"minecraft:custom_data":{ketket_shop:1b}}}]}] ["","[",{"text":"Player Shop","color":"green"},"]"," Changes successfully saved."]
tag @s add messagesended


