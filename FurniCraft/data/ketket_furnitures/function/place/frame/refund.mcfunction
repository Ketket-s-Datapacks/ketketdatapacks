$execute store result score #refund fc.frame_place run loot give @s loot ketket_furnitures:$(loot)
$execute unless score #refund fc.frame_place matches 1 run loot spawn ~ ~ ~ loot ketket_furnitures:$(loot)
