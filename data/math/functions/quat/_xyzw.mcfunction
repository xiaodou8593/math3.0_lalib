#math:quat/_xyzw
# 计算当前姿态赋值给临时四元数
# 输入<quat_phi,int>
# 输出{<quat_x,int>,<quat_y,int>,<quat_z,int>,<quat_w,int>}
# 需要以世界实体为执行者

#计算正余弦
execute store result entity @s Rotation[0] float -0.0001 run scoreboard players get quat_phi int
execute at @s positioned 0.0 0.0 0.0 rotated ~ 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score cos int run data get storage math:io xyz[2] 10000
execute store result score sin int run data get storage math:io xyz[0] 10000

#计算当前姿态
scoreboard players operation quat_x int = quat_start_x int
scoreboard players operation quat_x int *= cos int
scoreboard players operation sstemp int = quat_orth_x int
scoreboard players operation sstemp int *= sin int
scoreboard players operation quat_x int += sstemp int
scoreboard players operation quat_x int /= 10000 int

scoreboard players operation quat_y int = quat_start_y int
scoreboard players operation quat_y int *= cos int
scoreboard players operation sstemp int = quat_orth_y int
scoreboard players operation sstemp int *= sin int
scoreboard players operation quat_y int += sstemp int
scoreboard players operation quat_y int /= 10000 int

scoreboard players operation quat_z int = quat_start_z int
scoreboard players operation quat_z int *= cos int
scoreboard players operation sstemp int = quat_orth_z int
scoreboard players operation sstemp int *= sin int
scoreboard players operation quat_z int += sstemp int
scoreboard players operation quat_z int /= 10000 int

scoreboard players operation quat_w int = quat_start_w int
scoreboard players operation quat_w int *= cos int
scoreboard players operation sstemp int = quat_orth_w int
scoreboard players operation sstemp int *= sin int
scoreboard players operation quat_w int += sstemp int
scoreboard players operation quat_w int /= 10000 int