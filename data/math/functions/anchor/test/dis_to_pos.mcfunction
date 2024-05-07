#math:anchor/test/dis_to_pos
# 命令方块高频执行

scoreboard players set inp int 2500
execute as @p at @s anchored eyes positioned ^ ^ ^ as @e[tag=math_marker,limit=1] run function math:anchor/_dis_to_pos
execute at @e[tag=math_marker,limit=1] run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force @a