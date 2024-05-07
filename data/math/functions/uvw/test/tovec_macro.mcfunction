#math:uvw/test/tovec_macro
# 聊天栏调用

tellraw @a "--- uvw tovec macro test ---"

scoreboard players set u int 10000
scoreboard players set v int 0
scoreboard players set w int 0
execute positioned 0.0 0.0 0.0 rotated 45.0 0.0 as 0-0-0-0-0 run function math:uvw/_tovec_macro
function math:vec/_print

scoreboard players set u int 0
scoreboard players set v int 10000
scoreboard players set w int 0
execute positioned 0.0 0.0 0.0 rotated 45.0 0.0 as 0-0-0-0-0 run function math:uvw/_tovec_macro
function math:vec/_print

scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 10000
execute positioned 0.0 0.0 0.0 rotated 45.0 0.0 as 0-0-0-0-0 run function math:uvw/_tovec_macro
function math:vec/_print