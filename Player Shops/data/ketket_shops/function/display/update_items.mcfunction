# Build valid display stacks separately from the shop's persistent custom data.
execute unless data entity @e[type=item_display,sort=nearest,limit=1,tag=shopdata] item.components."minecraft:custom_data" run return fail
data modify storage ketket_shops:display shop set from entity @e[type=item_display,sort=nearest,limit=1,tag=shopdata] item.components."minecraft:custom_data"
data modify storage ketket_shops:display product set value {id:"minecraft:emerald",count:1}
execute if data storage ketket_shops:display shop.Product.id run data modify storage ketket_shops:display product set from storage ketket_shops:display shop.Product
data remove storage ketket_shops:display product.Slot
data modify storage ketket_shops:display product.count set value 1
data modify storage ketket_shops:display product.components."minecraft:custom_data" merge from storage ketket_shops:display shop
data modify entity @e[type=item_display,sort=nearest,limit=1,tag=shopdata] item set from storage ketket_shops:display product

data modify storage ketket_shops:display price set value {}
execute if data storage ketket_shops:display shop.Price.id run data modify storage ketket_shops:display price set from storage ketket_shops:display shop.Price
data remove storage ketket_shops:display price.Slot
execute if data storage ketket_shops:display price.id run data modify entity @e[tag=priceimg,sort=nearest,limit=1,type=item_display] item set from storage ketket_shops:display price
execute unless data storage ketket_shops:display price.id run data remove entity @e[tag=priceimg,sort=nearest,limit=1,type=item_display] item
data remove storage ketket_shops:display shop
data remove storage ketket_shops:display product
data remove storage ketket_shops:display price
