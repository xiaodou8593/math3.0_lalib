#math:vec/render/arrow
# math:vec/_render_debug调用

execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^-1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score sstemp0 int run data get storage math:io xyz[0] 10000
execute store result score sstemp1 int run data get storage math:io xyz[1] 10000
execute store result score sstemp2 int run data get storage math:io xyz[2] 10000
scoreboard players operation sstemp3 int = sstemp0 int
scoreboard players operation sstemp4 int = sstemp1 int
scoreboard players operation sstemp5 int = sstemp2 int
scoreboard players operation ssstemp3 int = ssstemp0 int
scoreboard players operation ssstemp4 int = ssstemp1 int
scoreboard players operation ssstemp5 int = ssstemp2 int

execute positioned 0.0 0.0 0.0 run tp @s ^-1.0 ^ ^
data modify storage math:io xyz set from entity @s Pos
execute store result score sstempi0 int run data get storage math:io xyz[0] 10000
execute store result score sstempi1 int run data get storage math:io xyz[1] 10000
execute store result score sstempi2 int run data get storage math:io xyz[2] 10000

execute positioned 0.0 0.0 0.0 run tp @s ^ ^1.0 ^
data modify storage math:io xyz set from entity @s Pos
execute store result score sstempj0 int run data get storage math:io xyz[0] 10000
execute store result score sstempj1 int run data get storage math:io xyz[1] 10000
execute store result score sstempj2 int run data get storage math:io xyz[2] 10000

execute facing entity @p eyes positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score sstempx int run data get storage math:io xyz[0] 10000
execute store result score sstempy int run data get storage math:io xyz[1] 10000
execute store result score sstempz int run data get storage math:io xyz[2] 10000

scoreboard players operation sstempu int = sstempx int
scoreboard players operation sstempu int *= sstempi0 int
scoreboard players operation sstemp6 int = sstempy int
scoreboard players operation sstemp6 int *= sstempi1 int
scoreboard players operation sstempu int += sstemp6 int
scoreboard players operation sstemp6 int = sstempz int
scoreboard players operation sstemp6 int *= sstempi2 int
execute store result entity @s Pos[2] double 0.00000001 run scoreboard players operation sstempu int += sstemp6 int

scoreboard players operation sstempv int = sstempx int
scoreboard players operation sstempv int *= sstempj0 int
scoreboard players operation sstemp6 int = sstempy int
scoreboard players operation sstemp6 int *= sstempj1 int
scoreboard players operation sstempv int += sstemp6 int
scoreboard players operation sstemp6 int = sstempz int
scoreboard players operation sstemp6 int *= sstempj2 int
execute store result entity @s Pos[0] double 0.00000001 run scoreboard players operation sstempv int += sstemp6 int

execute positioned 0.0 0.0 0.0 facing entity @s feet rotated ~90.0 0.0 run tp @s ^ ^ ^1.0
execute store result score sstempu int run data get entity @s Pos[2] 10000
execute store result score sstempv int run data get entity @s Pos[0] 10000

scoreboard players operation sstempi0 int *= sstempu int
scoreboard players operation sstempj0 int *= sstempv int
scoreboard players operation sstempi0 int += sstempj0 int
scoreboard players operation sstempi1 int *= sstempu int
scoreboard players operation sstempj1 int *= sstempv int
scoreboard players operation sstempi1 int += sstempj1 int
scoreboard players operation sstempi2 int *= sstempu int
scoreboard players operation sstempj2 int *= sstempv int
scoreboard players operation sstempi2 int += sstempj2 int
scoreboard players operation sstempi0 int /= 12500 int
scoreboard players operation sstempi1 int /= 12500 int
scoreboard players operation sstempi2 int /= 12500 int

scoreboard players operation sstempn int = vec_n int
scoreboard players operation sstempn int /= 5 int

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation sstemp0 int += sstempi0 int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp1 int += sstempi1 int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation sstemp2 int += sstempi2 int
data modify entity @s Pos set from storage math:io xyz

execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score sstemp0 int run data get storage math:io xyz[0] 10000
execute store result score sstemp1 int run data get storage math:io xyz[1] 10000
execute store result score sstemp2 int run data get storage math:io xyz[2] 10000

scoreboard players operation sstemp6 int = res int
scoreboard players operation sstemp7 int = res int
scoreboard players operation sstemp6 int /= 10000 int
scoreboard players operation sstemp7 int %= 10000 int

scoreboard players operation sstemp8 int = sstemp0 int
scoreboard players operation sstemp0 int *= sstemp6 int
scoreboard players operation sstemp8 int *= sstemp7 int
scoreboard players operation sstemp8 int /= 10000 int
scoreboard players operation sstemp0 int += sstemp8 int
scoreboard players operation sstemp0 int /= vec_n int

scoreboard players operation sstemp8 int = sstemp1 int
scoreboard players operation sstemp1 int *= sstemp6 int
scoreboard players operation sstemp8 int *= sstemp7 int
scoreboard players operation sstemp8 int /= 10000 int
scoreboard players operation sstemp1 int += sstemp8 int
scoreboard players operation sstemp1 int /= vec_n int

scoreboard players operation sstemp8 int = sstemp2 int
scoreboard players operation sstemp2 int *= sstemp6 int
scoreboard players operation sstemp8 int *= sstemp7 int
scoreboard players operation sstemp8 int /= 10000 int
scoreboard players operation sstemp2 int += sstemp8 int
scoreboard players operation sstemp2 int /= vec_n int

scoreboard players set ssloop int 0
execute if score ssloop int < sstempn int run function math:vec/render/loop_arrow with storage math:io {}

scoreboard players operation sstemp0 int = sstemp3 int
scoreboard players operation sstemp1 int = sstemp4 int
scoreboard players operation sstemp2 int = sstemp5 int
scoreboard players operation ssstemp0 int = ssstemp3 int
scoreboard players operation ssstemp1 int = ssstemp4 int
scoreboard players operation ssstemp2 int = ssstemp5 int

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation sstemp0 int -= sstempi0 int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp1 int -= sstempi1 int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation sstemp2 int -= sstempi2 int
data modify entity @s Pos set from storage math:io xyz

execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score sstemp0 int run data get storage math:io xyz[0] 10000
execute store result score sstemp1 int run data get storage math:io xyz[1] 10000
execute store result score sstemp2 int run data get storage math:io xyz[2] 10000

scoreboard players operation sstemp6 int = res int
scoreboard players operation sstemp7 int = res int
scoreboard players operation sstemp6 int /= 10000 int
scoreboard players operation sstemp7 int %= 10000 int

scoreboard players operation sstemp8 int = sstemp0 int
scoreboard players operation sstemp0 int *= sstemp6 int
scoreboard players operation sstemp8 int *= sstemp7 int
scoreboard players operation sstemp8 int /= 10000 int
scoreboard players operation sstemp0 int += sstemp8 int
scoreboard players operation sstemp0 int /= vec_n int

scoreboard players operation sstemp8 int = sstemp1 int
scoreboard players operation sstemp1 int *= sstemp6 int
scoreboard players operation sstemp8 int *= sstemp7 int
scoreboard players operation sstemp8 int /= 10000 int
scoreboard players operation sstemp1 int += sstemp8 int
scoreboard players operation sstemp1 int /= vec_n int

scoreboard players operation sstemp8 int = sstemp2 int
scoreboard players operation sstemp2 int *= sstemp6 int
scoreboard players operation sstemp8 int *= sstemp7 int
scoreboard players operation sstemp8 int /= 10000 int
scoreboard players operation sstemp2 int += sstemp8 int
scoreboard players operation sstemp2 int /= vec_n int

scoreboard players set ssloop int 0
execute if score ssloop int < sstempn int run function math:vec/render/loop_arrow with storage math:io {}