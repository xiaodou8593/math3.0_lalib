#math:uvw/test/render_debug_main
# math:uvw/test/render_debug异步调用

execute at @s anchored eyes positioned ^ ^ ^ as 0-0-0-0-0 run function math:anchor/_touvw

scoreboard players set vec_n int 200
scoreboard players set vec_scale int 2
execute as 0-0-0-0-0 run function math:uvw/_render_debug