#math:uvw/test/vecto_macro
# 聊天栏调用

tellraw @a "--- uvw vecto macro test ---"

scoreboard players set u int 10000
scoreboard players set v int 0
scoreboard players set w int 0
execute as 0-0-0-0-0 run function math:uvw/_tovec_macro
execute as 0-0-0-0-0 run function math:uvw/_vecto_macro
tellraw @a ["uvw: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]

scoreboard players set u int 0
scoreboard players set v int 10000
scoreboard players set w int 0
execute as 0-0-0-0-0 run function math:uvw/_tovec_macro
execute as 0-0-0-0-0 run function math:uvw/_vecto_macro
tellraw @a ["uvw: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]

scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 10000
execute as 0-0-0-0-0 run function math:uvw/_tovec_macro
execute as 0-0-0-0-0 run function math:uvw/_vecto_macro
tellraw @a ["uvw: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]