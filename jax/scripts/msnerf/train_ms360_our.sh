export CUDA_VISIBLE_DEVICES='4, 5'

# for real captured part
#SCENE=dexter_gameroom_20231021_gaochen
#SCENE=dexter_hi_everyone_20231021_gaochen
SCENE=yipengwang_Block20-I-GOT-UBNED
#SCENE=yipengwang_dexter-montlake-bridge
EXPERIMENT=logs_MS-NeRF-360
DATA_DIR=/home/yipengwang/dataset/msnerf/"$SCENE"
CHECKPOINT_DIR=/home/yipengwang/experiment/msnerf/"$EXPERIMENT"/"$SCENE"

rm "$CHECKPOINT_DIR"/*
python -m train \
  --gin_configs=configs/ms-nerf/ms360.gin \
  --gin_bindings="Config.dataset_loader = 'llff'" \
  --gin_bindings="Config.factor = -1" \
  --gin_bindings="Config.data_dir = '${DATA_DIR}'" \
  --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}'" \
  --logtostderr
