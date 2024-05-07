#math:vec/test/length
# 聊天栏调用

tellraw @a "--- math:vec length test ---"

scoreboard players set vec_x int 10000
scoreboard players set vec_y int 10000
scoreboard players set vec_z int 10000
function math:vec/_length
tellraw @a ["res: ", {"score":{"name":"res","objective":"int"}}]