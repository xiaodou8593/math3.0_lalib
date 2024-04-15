#math:uvw/_topos_macro
# 局部坐标转换世界坐标
# 输入执行坐标，执行高度(anchored eyes|feet)，执行朝向
# 输入{<u,int>,<v,int>,<w,int>}
# 输出entity @s Pos

execute store result storage math:io u double 0.0001 run scoreboard players get u int
execute store result storage math:io v double 0.0001 run scoreboard players get v int
execute store result storage math:io w double 0.0001 run scoreboard players get w int
function math:uvw/vec_macro with storage math:io {}