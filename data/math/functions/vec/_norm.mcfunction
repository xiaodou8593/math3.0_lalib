#math:vec/_norm
# 单位化三维向量
# 输出uvec{<uvec_x,int>,<uvec_y,int>,<uvec_z,int>}
# 输出世界实体的朝向
# 需要以世界实体为执行者

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get vec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get vec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get vec_z int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0 ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score uvec_x int run data get storage math:io xyz[0] 10000
execute store result score uvec_y int run data get storage math:io xyz[1] 10000
execute store result score uvec_z int run data get storage math:io xyz[2] 10000