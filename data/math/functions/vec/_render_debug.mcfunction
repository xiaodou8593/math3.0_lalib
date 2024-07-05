#math:vec/_render_debug
# 渲染三维向量
# 输入执行坐标作为向量起始点
# 输入<vec_n,int>控制粒子数量
# 输入storage math:io render_command
# 需要以世界实体为执行者

function math:vec/_length
scoreboard players operation res int *= 10 int

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation sstemp0 int = vec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp1 int = vec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation sstemp2 int = vec_z int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ~ ~ ~ ~ ~

scoreboard players operation sstemp3 int = sstemp0 int
scoreboard players operation sstemp4 int = sstemp1 int
scoreboard players operation sstemp5 int = sstemp2 int
scoreboard players operation sstemp3 int %= vec_n int
scoreboard players operation sstemp4 int %= vec_n int
scoreboard players operation sstemp5 int %= vec_n int
scoreboard players operation sstemp0 int /= vec_n int
scoreboard players operation sstemp1 int /= vec_n int
scoreboard players operation sstemp2 int /= vec_n int

tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score ssstemp0 int run data get storage math:io xyz[0] 10000
execute store result score ssstemp1 int run data get storage math:io xyz[1] 10000
execute store result score ssstemp2 int run data get storage math:io xyz[2] 10000

scoreboard players set ssstemp3 int 0
scoreboard players set ssstemp4 int 0
scoreboard players set ssstemp5 int 0
scoreboard players set ssloop int 0
execute if score ssloop int < vec_n int at @s run function math:vec/render/loop with storage math:io {}

execute if entity @p at @s run function math:vec/render/arrow

tp @s 0 0 0