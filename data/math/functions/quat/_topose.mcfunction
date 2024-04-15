#math:quat/_topose
# 将临时四元数指定为旋转的初始姿态
# 输入{<quat_x,int>,<quat_y,int>,<quat_z,int>,<quat_w,int>}

scoreboard players operation quat_start_x int = quat_x int
scoreboard players operation quat_start_y int = quat_y int
scoreboard players operation quat_start_z int = quat_z int
scoreboard players operation quat_start_w int = quat_w int