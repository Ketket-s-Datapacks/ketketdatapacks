# Frames outside their synchronous player callback are left for inspection.
tag @e[type=minecraft:item_frame,tag=fc.frame_pending] add fc.frame_unresolved
tag @e[type=minecraft:item_frame,tag=fc.frame_pending,tag=fc.frame_unresolved] remove fc.frame_pending
