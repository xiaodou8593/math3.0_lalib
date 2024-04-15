#math:uvw/_tovec_macro
# 局部坐标转换世界坐标
# 输入执行坐标，执行高度(anchored eyes|feet)，执行朝向
# 输入{<u,int>,<v,int>,<w,int>}
# 输出{<vec_x,int>,<vec_y,int>,<vec_z,int>}
# 需要以世界实体为执行者

execute store result storage math:io u double 0.0001 run scoreboard players get u int
execute store result storage math:io v double 0.0001 run scoreboard players get v int
execute store result storage math:io w double 0.0001 run scoreboard players get w int
function math:uvw/vec_macro with storage math:io {}
data modify storage math:io xyz set from entity @s Pos
execute store result score vec_x int run data get storage math:io xyz[0] 10000
execute store result score vec_y int run data get storage math:io xyz[1] 10000
execute store result score vec_z int run data get storage math:io xyz[2] 10000