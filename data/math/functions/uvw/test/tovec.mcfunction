#math:uvw/test/tovec
# 聊天栏调用

tellraw @a "--- uvw tovec test ---"

execute positioned 8593 15 3528 rotated 0.0 0.0 as 0-0-0-0-0 run function math:anchor/_touvw
function math:uvw/_print

execute positioned 0.0 0.0 0.0 rotated 45.0 0.0 as 0-0-0-0-0 run function math:anchor/_touvw
function math:uvw/_print

scoreboard players set u int 10000
scoreboard players set v int 0
scoreboard players set w int 0
function math:uvw/_tovec
function math:vec/_print

scoreboard players set u int 0
scoreboard players set v int 10000
scoreboard players set w int 0
function math:uvw/_tovec
function math:vec/_print

scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 10000
function math:uvw/_tovec
function math:vec/_print