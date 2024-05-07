#math:anchor/_dis_to_pos
# 获取前方距离处位置
# 输入非玩家执行者
# 输入<inp,int>表示1k精度距离
# 输出执行者实体坐标

# 基础坐标
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score sstemp_x int run data get storage math:io xyz[0] 10000
execute store result score sstemp_y int run data get storage math:io xyz[1] 10000
execute store result score sstemp_z int run data get storage math:io xyz[2] 10000

# 单位向量
execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score sstemp_fx int run data get storage math:io xyz[0] 10000
execute store result score sstemp_fy int run data get storage math:io xyz[1] 10000
execute store result score sstemp_fz int run data get storage math:io xyz[2] 10000

# 距离缩放
scoreboard players operation sstemp_fx int *= inp int
scoreboard players operation sstemp_fy int *= inp int
scoreboard players operation sstemp_fz int *= inp int
scoreboard players operation sstemp_fx int /= 1000 int
scoreboard players operation sstemp_fy int /= 1000 int
scoreboard players operation sstemp_fz int /= 1000 int

# 输出Pos
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation sstemp_x int += sstemp_fx int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp_y int += sstemp_fy int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation sstemp_z int += sstemp_fz int
data modify entity @s Pos set from storage math:io xyz