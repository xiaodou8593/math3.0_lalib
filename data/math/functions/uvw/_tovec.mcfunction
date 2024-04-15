#math:uvw/_tovec
# 局部坐标转换世界坐标
# 输入{<u,int>,<v,int>,<w,int>}
# 输出{<vec_x,int>,<vec_y,int>,<vec_z,int>}

scoreboard players operation vec_x int = ivec_x int
scoreboard players operation vec_x int *= u int
scoreboard players operation sstemp int = jvec_x int
scoreboard players operation sstemp int *= v int
scoreboard players operation vec_x int += sstemp int
scoreboard players operation sstemp int = kvec_x int
scoreboard players operation sstemp int *= w int
scoreboard players operation vec_x int += sstemp int
scoreboard players operation vec_x int /= 10000 int
scoreboard players operation vec_x int += x int

scoreboard players operation vec_y int = ivec_y int
scoreboard players operation vec_y int *= u int
scoreboard players operation sstemp int = jvec_y int
scoreboard players operation sstemp int *= v int
scoreboard players operation vec_y int += sstemp int
scoreboard players operation sstemp int = kvec_y int
scoreboard players operation sstemp int *= w int
scoreboard players operation vec_y int += sstemp int
scoreboard players operation vec_y int /= 10000 int
scoreboard players operation vec_y int += y int

scoreboard players operation vec_z int = ivec_z int
scoreboard players operation vec_z int *= u int
scoreboard players operation sstemp int = jvec_z int
scoreboard players operation sstemp int *= v int
scoreboard players operation vec_z int += sstemp int
scoreboard players operation sstemp int = kvec_z int
scoreboard players operation sstemp int *= w int
scoreboard players operation vec_z int += sstemp int
scoreboard players operation vec_z int /= 10000 int
scoreboard players operation vec_z int += z int