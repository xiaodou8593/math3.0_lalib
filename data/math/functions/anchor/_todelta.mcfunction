#math:anchor/_todelta
# 执行方位转三维向量
# 输入执行朝向
# 需要传入世界实体为执行者

execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score dx int run data get storage math:io xyz[0] 10000
execute store result score dy int run data get storage math:io xyz[1] 10000
execute store result score dz int run data get storage math:io xyz[2] 10000