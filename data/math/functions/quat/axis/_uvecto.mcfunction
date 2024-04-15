#math:quat/axis/_uvecto
# 使用单位向量uvec指定旋转轴
# 输入{<uvec_x,int>, <uvec_y,int>, <uvec_z,int>}

#x分量
scoreboard players operation quat_orth_x int = uvec_x int
scoreboard players operation quat_orth_x int *= quat_start_w int
scoreboard players operation sstemp int = uvec_y int
scoreboard players operation sstemp int *= quat_start_z int
scoreboard players operation quat_orth_x int += sstemp int
scoreboard players operation sstemp int = uvec_z int
scoreboard players operation sstemp int *= quat_start_y int
scoreboard players operation quat_orth_x int -= sstemp int
scoreboard players operation quat_orth_x int /= 10000 int

#y分量
scoreboard players operation quat_orth_y int = uvec_y int
scoreboard players operation quat_orth_y int *= quat_start_w int
scoreboard players operation sstemp int = uvec_x int
scoreboard players operation sstemp int *= quat_start_z int
scoreboard players operation quat_orth_y int -= sstemp int
scoreboard players operation sstemp int = uvec_z int
scoreboard players operation sstemp int *= quat_start_x int
scoreboard players operation quat_orth_y int += sstemp int
scoreboard players operation quat_orth_y int /= 10000 int

#z分量
scoreboard players operation quat_orth_z int = uvec_x int
scoreboard players operation quat_orth_z int *= quat_start_y int
scoreboard players operation sstemp int = uvec_y int
scoreboard players operation sstemp int *= quat_start_x int
scoreboard players operation quat_orth_z int -= sstemp int
scoreboard players operation sstemp int = uvec_z int
scoreboard players operation sstemp int *= quat_start_w int
scoreboard players operation quat_orth_z int += sstemp int
scoreboard players operation quat_orth_z int /= 10000 int

#w分量
scoreboard players operation quat_orth_w int = uvec_x int
scoreboard players operation quat_orth_w int *= quat_start_x int
scoreboard players operation sstemp int = uvec_y int
scoreboard players operation sstemp int *= quat_start_y int
scoreboard players operation quat_orth_w int += sstemp int
scoreboard players operation sstemp int = uvec_z int
scoreboard players operation sstemp int *= quat_start_z int
scoreboard players operation quat_orth_w int += sstemp int
scoreboard players operation quat_orth_w int /= -10000 int