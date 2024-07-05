#math:uvw/test/render_debug
# 聊天栏调用

# 生成旋转测试
function math:test/_coords
data modify storage math:io input set value {states:["horizontal","vertical"],facing_rate:3}
execute at @e[tag=test_coord,limit=1] run function math:test/facing_tester/_new

# 异步调用测试函数
execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.tick_func set value "math:uvw/test/render_debug_main"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked