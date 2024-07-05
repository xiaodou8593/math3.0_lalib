#math:vec/render/loop
# math:vec/_render_debug调用

$$(render_command)

scoreboard players operation ssstemp3 int += sstemp3 int
scoreboard players operation ssstemp4 int += sstemp4 int
scoreboard players operation ssstemp5 int += sstemp5 int
scoreboard players operation ssstemp6 int = ssstemp3 int
scoreboard players operation ssstemp7 int = ssstemp4 int
scoreboard players operation ssstemp8 int = ssstemp5 int
scoreboard players operation ssstemp6 int /= vec_n int
scoreboard players operation ssstemp7 int /= vec_n int
scoreboard players operation ssstemp8 int /= vec_n int
scoreboard players operation ssstemp0 int += ssstemp6 int
scoreboard players operation ssstemp1 int += ssstemp7 int
scoreboard players operation ssstemp2 int += ssstemp8 int
scoreboard players operation ssstemp3 int %= vec_n int
scoreboard players operation ssstemp4 int %= vec_n int
scoreboard players operation ssstemp5 int %= vec_n int

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation ssstemp0 int += sstemp0 int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation ssstemp1 int += sstemp1 int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation ssstemp2 int += sstemp2 int
data modify entity @s Pos set from storage math:io xyz

scoreboard players add ssloop int 1
execute if score ssloop int < vec_n int at @s run function math:vec/render/loop with storage math:io {}