
function ketket_furnitures:interaction/changetype/settag

execute as @e[type=interaction,limit=1,nbt={interaction:{}},sort=nearest] run tag @s add birch
execute as @e[type=block_display,distance=..0.5,tag=log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.log"}
execute as @e[type=block_display,distance=..0.5,tag=planks] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.planks"}
execute as @e[type=block_display,distance=..0.5,tag=plank] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.planks"}
execute as @e[type=block_display,distance=..0.5,tag=wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.wood"}
execute as @e[type=block_display,distance=..0.5,tag=stripped_wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.stripped_wood"}
execute as @e[type=block_display,distance=..0.5,tag=stripped_log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.stripped_log"}
execute as @e[type=block_display,distance=..0.5,tag=fence] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.fence"}
execute as @e[type=block_display,distance=..0.5,tag=fence_gate] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.fence_gate"}
execute as @e[type=block_display,distance=..0.5,tag=button] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.button"}
execute as @e[type=block_display,distance=..0.5,tag=trapdoor] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.trapdoor"}
execute as @e[type=block_display,distance=..0.5,tag=door] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.door"}
execute as @e[type=block_display,distance=..0.5,tag=pressure_plate] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.pressure_plate"}

execute if data entity @s SelectedItem{id:"minecraft:stripped_birch_log"} run execute as @e[type=block_display,distance=..0.5,tag=log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.stripped_log"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_birch_log"} run execute as @e[type=block_display,distance=..0.5,tag=wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.stripped_wood"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_birch_wood"} run execute as @e[type=interaction,limit=1,nbt={interaction:{}},sort=nearest] run tag @s add stripped

execute if data entity @s SelectedItem{id:"minecraft:stripped_birch_wood"} run execute as @e[type=block_display,distance=..0.5,tag=log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.stripped_log"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_birch_wood"} run execute as @e[type=block_display,distance=..0.5,tag=wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.birch.stripped_wood"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_birch_wood"} run execute as @e[type=interaction,limit=1,nbt={interaction:{}},sort=nearest] run tag @s add stripped
