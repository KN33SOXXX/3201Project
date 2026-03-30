# 3201Project
Part 1d Plan A操作说明：
请先确认当前环境中已经正确安装 `colmap`：
使用conda install conda-forge::colmap安装colmap组件

1. 当前支持的数据集

脚本目前支持以下数据集 key：

re10k → data/Re10k-1/images
dl3dv → data/DL3DV-2/rgb
waymo_front → data/405841/FRONT/rgb

2. 运行 COLMAP
Re10k-1
bash scripts/run_colmap.sh re10k
DL3DV-2
bash scripts/run_colmap.sh dl3dv
Waymo FRONT
bash scripts/run_colmap.sh waymo_front

脚本支持以下可选参数：

bash scripts/run_colmap.sh [dataset_key] [matcher] [use_gpu]

参数说明：

dataset_key：re10k | dl3dv | waymo_front
matcher：sequential | exhaustive
use_gpu：1 | 0

3. 检查所有 sparse reconstruction
为了检查所有生成的 sparse 模型，并自动选出最优模型，可以运行：

bash scripts/inspect_colmap.sh re10k 0
bash scripts/inspect_colmap.sh dl3dv 0
bash scripts/inspect_colmap.sh waymo_front 0
该脚本会对每个 sparse/N 模型统计：

注册图像数量（Registered images）
稀疏点云数量（Sparse points3D）

并按照以下规则自动选择最佳模型：

优先选择 注册图像数最多 的模型
如果注册图像数相同，则选择 稀疏点数更多 的模型

4. 保存最佳模型的 TXT 格式结果

如果希望把最佳模型额外导出为 TXT 格式，便于检查内容，可以运行：

bash scripts/inspect_colmap.sh re10k 1
bash scripts/inspect_colmap.sh dl3dv 1
bash scripts/inspect_colmap.sh waymo_front 1

这会生成：

outputs/colmap/<SCENE_NAME>/best_sparse_txt/