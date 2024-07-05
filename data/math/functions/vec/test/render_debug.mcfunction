#math:vec/test/render_debug
# 命令方块高频调用

scoreboard players set vec_x int 20000
scoreboard players set vec_y int 20000
scoreboard players set vec_z int 20000

scoreboard players set vec_n int 200
data modify storage math:io render_command set from storage math:class particle_commands.red_dust

function math:test/_coords
execute at @e[tag=test_coord,limit=1] positioned ~ ~1.5 ~ as 0-0-0-0-0 run function math:vec/_render_debug