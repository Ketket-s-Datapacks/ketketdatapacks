function ketket_furnitures:interaction/changetype/settag

execute as @e[type=interaction,limit=1,nbt={interaction:{}},sort=nearest] run tag @s add acacia
execute as @e[type=block_display,distance=..0.5,tag=log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.log"}
execute as @e[type=block_display,distance=..0.5,tag=planks] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.planks"}
execute as @e[type=block_display,distance=..0.5,tag=plank] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.planks"}
execute as @e[type=block_display,distance=..0.5,tag=wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.wood"}
execute as @e[type=block_display,distance=..0.5,tag=stripped_wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.stripped_wood"}
execute as @e[type=block_display,distance=..0.5,tag=stripped_log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.stripped_log"}
execute as @e[type=block_display,distance=..0.5,tag=fence] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.fence"}
execute as @e[type=block_display,distance=..0.5,tag=fence_gate] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.fence_gate"}
execute as @e[type=block_display,distance=..0.5,tag=button] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.button"}
execute as @e[type=block_display,distance=..0.5,tag=trapdoor] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.trapdoor"}
execute as @e[type=block_display,distance=..0.5,tag=door] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.door"}
execute as @e[type=block_display,distance=..0.5,tag=pressure_plate] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.pressure_plate"}

execute if data entity @s SelectedItem{id:"minecraft:stripped_acacia_log"} run execute as @e[type=block_display,distance=..0.5,tag=log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.stripped_log"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_acacia_log"} run execute as @e[type=block_display,distance=..0.5,tag=wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.stripped_wood"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_acacia_wood"} run execute as @e[type=interaction,limit=1,nbt={interaction:{}},sort=nearest] run tag @s add stripped

execute if data entity @s SelectedItem{id:"minecraft:stripped_acacia_wood"} run execute as @e[type=block_display,distance=..0.5,tag=log] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.stripped_log"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_acacia_wood"} run execute as @e[type=block_display,distance=..0.5,tag=wood] run function ketket_furnitures:internal/block_state/from_storage {storage:"typeholder",path:"type.acacia.stripped_wood"}
execute if data entity @s SelectedItem{id:"minecraft:stripped_acacia_wood"} run execute as @e[type=interaction,limit=1,nbt={interaction:{}},sort=nearest] run tag @s add stripped
