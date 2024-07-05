#math:quat/_touvw
# 四元数姿态转局部坐标系
# 输出{<ivec_x>,<ivec_y>,<ivec_z>}, {<jvec_x>,<jvec_y>,<jvec_z>}, {<kvec_x>,<kvec_y>,<kvec_z>}

execute store result score ivec_y int store result score ivec_z int store result score sstempxw int run scoreboard players operation ivec_x int = quat_x int
scoreboard players operation ivec_x int *= quat_x int
execute store result score jvec_z int store result score sstempyw int run scoreboard players operation jvec_y int = quat_y int
scoreboard players operation jvec_y int *= quat_y int
execute store result score sstempzw int run scoreboard players operation kvec_z int = quat_z int
scoreboard players operation kvec_z int *= quat_z int
scoreboard players operation sstempx2 int = ivec_x int
scoreboard players operation sstempy2 int = jvec_y int
scoreboard players operation sstempw2 int = quat_w int
scoreboard players operation sstempw2 int *= quat_w int
scoreboard players operation ivec_x int += sstempw2 int
scoreboard players operation ivec_x int -= jvec_y int
scoreboard players operation ivec_x int -= kvec_z int
scoreboard players operation jvec_y int += sstempw2 int
scoreboard players operation jvec_y int -= sstempx2 int
scoreboard players operation jvec_y int -= kvec_z int
scoreboard players operation kvec_z int += sstempw2 int
scoreboard players operation kvec_z int -= sstempx2 int
scoreboard players operation kvec_z int -= sstempy2 int

scoreboard players operation ivec_x int /= 10000 int
scoreboard players operation jvec_y int /= 10000 int
scoreboard players operation kvec_z int /= 10000 int

scoreboard players operation ivec_y int *= quat_y int
scoreboard players operation jvec_x int = ivec_y int
scoreboard players operation sstempzw int *= quat_w int
scoreboard players operation ivec_y int += sstempzw int
scoreboard players operation jvec_x int -= sstempzw int

scoreboard players operation ivec_y int /= 5000 int
scoreboard players operation jvec_x int /= 5000 int

scoreboard players operation ivec_z int *= quat_z int
scoreboard players operation kvec_x int = ivec_z int
scoreboard players operation sstempyw int *= quat_w int
scoreboard players operation ivec_z int -= sstempyw int
scoreboard players operation kvec_x int += sstempyw int

scoreboard players operation ivec_z int /= 5000 int
scoreboard players operation kvec_x int /= 5000 int

scoreboard players operation jvec_z int *= quat_z int
scoreboard players operation kvec_y int = jvec_z int
scoreboard players operation sstempxw int *= quat_w int
scoreboard players operation jvec_z int += sstempxw int
scoreboard players operation kvec_y int -= sstempxw int

scoreboard players operation jvec_z int /= 5000 int
scoreboard players operation kvec_y int /= 5000 int