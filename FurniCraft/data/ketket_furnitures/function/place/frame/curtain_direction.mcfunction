# A wall skull stored the outward face. Curtains use its opposite direction.
execute if score #face fc.frame_place matches 2 run scoreboard players set #model_direction fc.frame_place 0
execute if score #face fc.frame_place matches 3 run scoreboard players set #model_direction fc.frame_place 3
execute if score #face fc.frame_place matches 4 run scoreboard players set #model_direction fc.frame_place 2
execute if score #face fc.frame_place matches 5 run scoreboard players set #model_direction fc.frame_place 1
