# Remove the drop of this mailbox's decorative skull before yielding its furniture item.
execute align xyz run kill @e[type=minecraft:item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:player_head",components:{"minecraft:profile":{id:[I;-30050627,683886553,-1448661683,-999665402]}}}},limit=1]
tag @s add dropitem
function ketket_furnitures:remover/mailbox/checker
