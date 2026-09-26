$execute unless data entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].components."minecraft:container" if data entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].components."minecraft:custom_data"{quick_shulker:1} run function ketket_shulkers:writer/returnitem with storage minecraft:ket
$execute if data entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].components."minecraft:custom_data"{quick_shulker:1} if data entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].components."minecraft:container" run function ketket_shulkers:writer/returnitem with storage minecraft:ket
$execute if data entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].components."minecraft:container" run function ketket_shulkers:writer/returnitem with storage minecraft:ket

$data modify entity @e[tag=this,type=hopper_minecart,limit=1] Items[0].components."minecraft:container"[{slot:$(for)}].item.id set from entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].id
$data modify entity @e[tag=this,type=hopper_minecart,limit=1] Items[0].components."minecraft:container"[{slot:$(for)}].item.count set from entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].count
$data modify entity @e[tag=this,type=hopper_minecart,limit=1] Items[0].components."minecraft:container"[{slot:$(for)}].item.components set from entity @e[scores={ket.ID=$(x)},type=chest_minecart,limit=1] Items[{Slot:$(for)b}].components

# An empty container slot is represented by no slot entry. Removing only `item` leaves an invalid `{slot:...}` entry.
$execute if data entity @e[tag=this,type=hopper_minecart,limit=1] Items[0].components."minecraft:container"[{slot:$(for),item:{id:"minecraft:knowledge_book"}}] run data remove entity @e[tag=this,type=hopper_minecart,limit=1] Items[0].components."minecraft:container"[{slot:$(for)}]

