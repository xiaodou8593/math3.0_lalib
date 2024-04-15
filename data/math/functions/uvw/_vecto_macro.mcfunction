#math:uvw/_vecto_macro
# 世界坐标转换局部坐标
# 输入执行坐标，执行高度(anchored eyes|feet)，执行朝向
# 输入{<vec_x,int>,<vec_y,int>,<vec_z,int>}
# 输出{<u,int>,<v,int>,<w,int>}
# 需要以世界实体为执行者

tp @s ^ ^ ^ ~ ~
data modify storage math:io rotation set from entity @s Rotation
data modify storage math:io rotation append from storage math:io rotation[0]
data remove storage math:io rotation[0]
data modify entity @s Rotation set from storage math:io rotation

data modify storage math:io xyz set from entity @s Pos
execute store result score sstempx int run data get storage math:io xyz[0] 10000
execute store result score sstempy int run data get storage math:io xyz[1] 10000
execute store result score sstempz int run data get storage math:io xyz[2] 10000
execute store result storage math:io v double -0.0001 run scoreboard players operation sstempx int -= vec_x int
execute store result storage math:io u double -0.0001 run scoreboard players operation sstempy int -= vec_y int
execute store result storage math:io w double 0.0001 run scoreboard players operation sstempz int -= vec_z int
execute at @s positioned 0.0 0.0 0.0 run function math:uvw/vec_macro with storage math:io {}
data modify storage math:io xyz set from entity @s Pos

execute store result score u int run data get storage math:io xyz[1] 10000
execute store result score v int run data get storage math:io xyz[0] 10000
execute store result score w int run data get storage math:io xyz[2] -10000