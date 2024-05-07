#math:vec/test/unit
# 聊天栏调用

tellraw @a "--- math:vec unit test ---"

scoreboard players set vec_x int 10000
scoreboard players set vec_y int 10000
scoreboard players set vec_z int 10000
execute as 0-0-0-0-0 run function math:vec/_unit
tellraw @a ["res: ", {"score":{"name":"res","objective":"int"}}]
function math:uvec/_print