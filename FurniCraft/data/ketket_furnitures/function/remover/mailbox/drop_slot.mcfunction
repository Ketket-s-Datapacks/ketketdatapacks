data remove storage ketket_furnitures:mailbox_drop item
$data modify storage ketket_furnitures:mailbox_drop item.stack set from entity @e[type=minecraft:item_display,tag=mailstorage,distance=..0.5,sort=nearest,limit=1] item.components."minecraft:custom_data".Storage[$(slot)]
execute if data storage ketket_furnitures:mailbox_drop item.stack run function ketket_furnitures:remover/mailbox/spawn_content with storage ketket_furnitures:mailbox_drop item
data remove storage ketket_furnitures:mailbox_drop item
