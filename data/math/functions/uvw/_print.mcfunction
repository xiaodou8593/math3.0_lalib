#math:uvw/_print
# 输出局部坐标系

tellraw @a "math:uvw{"
tellraw @a ["    xyz: ", {"score":{"name":"x","objective":"int"}}, ", ", {"score":{"name":"y","objective":"int"}}, ", ", {"score":{"name":"z","objective":"int"}}]
tellraw @a ["    ivec: ", {"score":{"name":"ivec_x","objective":"int"}}, ", ", {"score":{"name":"ivec_y","objective":"int"}}, ", ", {"score":{"name":"ivec_z","objective":"int"}}]
tellraw @a ["    jvec: ", {"score":{"name":"jvec_x","objective":"int"}}, ", ", {"score":{"name":"jvec_y","objective":"int"}}, ", ", {"score":{"name":"jvec_z","objective":"int"}}]
tellraw @a ["    kvec: ", {"score":{"name":"kvec_x","objective":"int"}}, ", ", {"score":{"name":"kvec_y","objective":"int"}}, ", ", {"score":{"name":"kvec_z","objective":"int"}}]
tellraw @a "}"