#math:vec/_unit_sqrt
# 单位化三维向量并计算模长
# 输出uvec{<uvec_x,int>,<uvec_y,int>,<uvec_z,int>}
# 输出<res,int>, 1k倍率

function math:vec/_length

scoreboard players operation uvec_x int = vec_x int
scoreboard players operation uvec_y int = vec_y int
scoreboard players operation uvec_z int = vec_z int
scoreboard players operation uvec_x int *= 1000 int
scoreboard players operation uvec_y int *= 1000 int
scoreboard players operation uvec_z int *= 1000 int
scoreboard players operation uvec_x int /= res int
scoreboard players operation uvec_y int /= res int
scoreboard players operation uvec_z int /= res int