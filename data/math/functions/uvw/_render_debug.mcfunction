#math:uvw/_render_debug
# 渲染局部坐标系
# 输入<vec_n,int>控制粒子数量
# 输入<vec_scale,int>控制向量缩放(整数精度)
# 本接口需要使用gelib中的particles模块加载预设的粒子命令
# 需要以世界实体为执行者

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify entity @s Pos set from storage math:io xyz

# 倍率缩放
scoreboard players operation ivec_x int *= vec_scale int
scoreboard players operation ivec_y int *= vec_scale int
scoreboard players operation ivec_z int *= vec_scale int
scoreboard players operation jvec_x int *= vec_scale int
scoreboard players operation jvec_y int *= vec_scale int
scoreboard players operation jvec_z int *= vec_scale int
scoreboard players operation kvec_x int *= vec_scale int
scoreboard players operation kvec_y int *= vec_scale int
scoreboard players operation kvec_z int *= vec_scale int

# 渲染向量
execute at @s run function math:uvw/render/base_vecs

# 缩放还原
scoreboard players operation ivec_x int /= vec_scale int
scoreboard players operation ivec_y int /= vec_scale int
scoreboard players operation ivec_z int /= vec_scale int
scoreboard players operation jvec_x int /= vec_scale int
scoreboard players operation jvec_y int /= vec_scale int
scoreboard players operation jvec_z int /= vec_scale int
scoreboard players operation kvec_x int /= vec_scale int
scoreboard players operation kvec_y int /= vec_scale int
scoreboard players operation kvec_z int /= vec_scale int

tp @s 0 0 0