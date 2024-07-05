#math:vec/render/loop_arrow
# math:vec/render/arrow调用

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation ssstemp0 int += sstemp0 int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation ssstemp1 int += sstemp1 int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation ssstemp2 int += sstemp2 int
data modify entity @s Pos set from storage math:io xyz
$execute at @s run $(render_command)

scoreboard players add ssloop int 1
execute if score ssloop int < sstempn int run function math:vec/render/loop_arrow with storage math:io {}