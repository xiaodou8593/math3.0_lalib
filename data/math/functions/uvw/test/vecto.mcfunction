#math:uvw/test/vecto
# 聊天栏调用

tellraw @a "--- uvw vecto test ---"

execute positioned 85.0 9.0 34.0 rotated 45.0 0.0 as 0-0-0-0-0 run function math:anchor/_touvw
function math:uvw/_print

scoreboard players set u int 10000
scoreboard players set v int 0
scoreboard players set w int 0
function math:uvw/_tovec
function math:uvw/_vecto
tellraw @a ["uvw: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]

scoreboard players set u int 0
scoreboard players set v int 10000
scoreboard players set w int 0
function math:uvw/_tovec
function math:uvw/_vecto
tellraw @a ["uvw: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]

scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 10000
function math:uvw/_tovec
function math:uvw/_vecto
tellraw @a ["uvw: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]