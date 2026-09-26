# A default block state is serialized as a string in 26.3. Preserve properties
# from non-default states, and replace the entire state after changing its id.
execute unless entity @s[type=minecraft:block_display] run return fail
data modify storage ketket_furnitures:block_state state set from entity @s block_state
execute unless data storage ketket_furnitures:block_state state.id run data modify storage ketket_furnitures:block_state state set value {}
$data modify storage ketket_furnitures:block_state state.id set value "$(id)"
return run data modify entity @s block_state set from storage ketket_furnitures:block_state state
