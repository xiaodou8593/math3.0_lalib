#math:quat/_unit
# 把临时四元数单位化
# 输入{<quat_x,int>, <quat_y,int>, <quat_z,int>, <quat_w,int>}

#计算模长平方
scoreboard players operation inp int = quat_x int
scoreboard players operation inp int *= inp int
scoreboard players operation sstemp int = quat_y int
scoreboard players operation sstemp int *= sstemp int
scoreboard players operation inp int += sstemp int
scoreboard players operation sstemp int = quat_z int
scoreboard players operation sstemp int *= sstemp int
scoreboard players operation inp int += sstemp int
scoreboard players operation sstemp int = quat_w int
scoreboard players operation sstemp int *= sstemp int
scoreboard players operation inp int += sstemp int

#使用整数精度开根号(输入输出是inp和res)
function math:_sqrt

#四元数单位化
scoreboard players operation quat_x int *= 10000 int
scoreboard players operation quat_x int /= res int
scoreboard players operation quat_y int *= 10000 int
scoreboard players operation quat_y int /= res int
scoreboard players operation quat_z int *= 10000 int
scoreboard players operation quat_z int /= res int
scoreboard players operation quat_w int *= 10000 int
scoreboard players operation quat_w int /= res int