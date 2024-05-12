import argparse
import os
import logging
import re

# 定制，只为满足需求，无泛用性，慎重使用。
# 把一个包里的临时对象，转一下命名空间什么的，放到另一个包里用
logging.basicConfig(level=logging.DEBUG,  # 设置日志级别
                    format='%(asctime)s - %(levelname)s - %(lineno)d - %(message)s',  # 设置日志格式
                    handlers=[logging.FileHandler(filename=r'transfer.log',mode='w',encoding='utf-8')])  # 设置文件打开模式，'w'表示写入（会覆盖原有内容），'a'表示追加
# 记录日志
logger = logging.getLogger("expr")

if not (os.path.exists(os.path.join(os.getcwd(), "data")) and os.path.exists(os.path.join(os.getcwd(), "pack.mcmeta"))):
    logger.error(r"%s 路径错误，请检查路径"%(os.getcwd()))

parser = argparse.ArgumentParser()
parser.add_argument("mcpath", type=str, nargs='+', help='mc函数路径格式，必须含有命名空间，至少两个参数，之前的参数为需要转移的目录或文件，最后一个参数为转移的目标目录，被转移的路径和目标路径之间不能为父子关系。', default=[])


args = parser.parse_args()
if len(args.mcpath) < 2:
    logger.error("参数过少")

re_file_mcpath = re.compile(r'(?:.*?)function\s([a-z0-9\-_\.]*:[a-z0-9\-_\./]*)|(?:.*?)"([a-z0-9\-_\.]*:[a-z0-9\-_\./]*)"|#(?:.*?)([a-z0-9\-_\.]*:[a-z0-9\-_\./]*)')
re_mcpath = re.compile(r'([a-z0-9\-_\.]*):([a-z0-9\-_\./]*)')
re_path = re.compile(r'(?:.*/+data/+)([a-z0-9\-_\.]*)/+functions/+(.*)')
re_basename = re.compile(r'(?:.*)\.([a-z0-9\-_]+)$')

def mcpath2path(mcpath:str):
    m = re_mcpath.match(mcpath)
    if not m:
        logger.error("%s 路径格式有误"%(mcpath))
        exit()
    namespace = m.group(1)
    func_path = m.group(2)
    path = r"%s/data/%s/functions/%s"%(os.getcwd(), namespace, func_path)+("" if not func_path or func_path[-1] == "/" else ".mcfunction")
    logger.debug("namespace: %s, path: %s"%(namespace, func_path))
    logger.debug(path)
    return path

def path2mcpath(path:str):
    path = path.replace("\\", "/")
    m = re_path.match(path)
    if not m:
        logger.error("%s 错误路径"%(path))
        exit()
    namespace = m.group(1)
    func_path = m.group(2)
    if not namespace:
        namespace = "minecraft"
    if re_basename.match(func_path):
        if func_path.endswith(".mcfunction"):
            func_path = func_path[:-11]
        else:
            return None
    elif not func_path or not func_path.endswith("/"):
        func_path += "/"
    mcpath = r"%s:%s"%(namespace, func_path)
    logger.debug(mcpath)
    return mcpath

def mcpath_split(mcpath:str):
    namespace, path = mcpath.split(":")[:2]
    return (namespace, path)

logger.debug("待转化参数 %s"%(args.mcpath[:-1]))
logger.debug("待输出参数 %s"%(args.mcpath[-1]))
input_mcpath = args.mcpath[:-1]
output_path = mcpath2path(args.mcpath[-1])
logger.debug("待输出参数mcpath2path %s"%(output_path))
output_mcpath = path2mcpath(output_path)


path_deque = []
record_paths = set()
mcpath_map = {}
pending_tranlates = {}


def func_or_dir(path):
    #可以过滤不存在的文件
    if os.path.isdir(path):
        for root, dirs, files in os.walk(path):
            logger.info(r'扫描路径 %s'%(root))
            for file in files:
                if file.endswith(".mcfunction"):
                    path_deque.append((root + "/" +file).replace("\\", "/"))
                    logger.info(r'标注处理 %s'%(root + file))
    elif os.path.isfile(path):
        logger.info(r'标注处理 %s'%(path))
        path_deque.append(path)
    else:
        logger.info(r'这玩意不处理 %s'%(path))

for mcpath in input_mcpath:
    path = mcpath2path(mcpath)
    func_or_dir(path)

logger.debug("path_deque长度: %s"%(len(path_deque)))

i = 0
while i < len(path_deque):
    path = path_deque[i]
    if os.path.exists(path):
        record_paths.add(path)
        mcpath = path2mcpath(path)
        if mcpath in mcpath_map:
            i += 1
            continue
        namespace, mc_dir = mcpath_split(mcpath)
        output_namespace, output_mc_dir = mcpath_split(output_mcpath)
        mcpath_map[mcpath] = output_namespace + ":" + ("" if output_mc_dir == "/" else output_mc_dir) + mc_dir
        if os.path.isfile(path):
            pending_tranlates[mcpath] = []
            match_results= []
            logger.debug("%s %s %s %s %s"%(namespace, mc_dir, output_namespace, output_mc_dir, mcpath_map[mcpath]))
            with open(path, encoding="utf-8") as f:
                match_results = re_file_mcpath.findall(f.read())
            for match_result in match_results:
                pending_mcpath = match_result[0] if match_result[0] else None
                pending_mcpath = match_result[1] if match_result[1] else pending_mcpath
                pending_mcpath = match_result[2] if match_result[2] else pending_mcpath
                pending_path = mcpath2path(pending_mcpath)
                pending_tranlates[mcpath].append(pending_mcpath)
                if not pending_path in record_paths:
                    path_deque.append(pending_path)
                    record_paths.add(pending_path)
            pending_tranlates[mcpath].sort(key=lambda x: -len(x))
            logger.info("已提取 %s 中需要转化 %s"%(path, pending_tranlates[mcpath]))
        else:
            for root, dirs, files in os.walk(path):
                logger.info(r'扫描路径 %s'%(root))
                for file in files:
                    if file.endswith(".mcfunction"):
                        pending_path = (root + "/" +file).replace("\\", "/")
                        if not pending_path in record_paths:
                            path_deque.append(pending_path)
                            record_paths.add(pending_path)
                            logger.info(r'标注处理 %s'%(root + file))
    i += 1

logger.debug("%s"%(mcpath_map))

transfered_mcpaths = set()

for path in path_deque:
    mcpath = path2mcpath(path)
    if mcpath in transfered_mcpaths:
        logger.debug("已尝试进行转化 %s - %s"%(mcpath, path))
    transfered_mcpaths.add(mcpath)
    if not mcpath in mcpath_map:
        logger.debug("不存在 %s - %s"%(mcpath, path))
        continue
    logger.info("正在尝试转化 %s - %s"%(path, mcpath))
    result_mcpath = mcpath_map[mcpath]
    result_path = mcpath2path(result_mcpath)
    path_dir = os.path.dirname(result_path)
    if not os.path.exists(path_dir):
        os.makedirs(path_dir)
    if os.path.isdir(path):
        logger.info("目录不转化 %s - %s"%(path, mcpath))
        continue
    tt = ""
    with open(path, encoding="utf-8") as f:
            tt = f.read()
    for key_word in pending_tranlates[mcpath]:
        if not key_word in mcpath_map:
            logger.debug("没有翻译 %s 中的 %s"%(path, key_word))
            continue
        tt =  tt.replace(key_word, mcpath_map[key_word])
        logger.info("已将 %s 中 %s 替换为 %s"%(path, key_word, mcpath_map[key_word]))

    with open(result_path, "w", encoding="utf-8") as f:
        f.write(tt)
    logger.info("已将 %s 转化为 %s"%(path, result_path))
logger.info("转化完成")