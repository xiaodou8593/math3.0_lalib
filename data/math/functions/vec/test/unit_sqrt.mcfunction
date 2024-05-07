#math:vec/test/unit_sqrt
# 聊天栏调用

tellraw @a "--- math:vec unit_sqrt test ---"

scoreboard players set vec_x int 10000
scoreboard players set vec_y int 10000
scoreboard players set vec_z int 10000
function math:vec/_unit_sqrt
tellraw @a ["res: ", {"score":{"name":"res","objective":"int"}}]
function math:uvec/_print