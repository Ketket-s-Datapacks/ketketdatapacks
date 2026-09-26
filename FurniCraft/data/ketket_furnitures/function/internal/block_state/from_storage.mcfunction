# Do not reuse the previous material if the requested storage path is absent.
$execute unless data storage $(storage) $(path) run return fail
execute unless entity @s[type=minecraft:block_display] run return fail
data modify storage ketket_furnitures:block_state state set from entity @s block_state
execute unless data storage ketket_furnitures:block_state state.id run data modify storage ketket_furnitures:block_state state set value {}
$data modify storage ketket_furnitures:block_state state.id set from storage $(storage) $(path)
return run data modify entity @s block_state set from storage ketket_furnitures:block_state state
