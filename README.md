## Singularity container for [chemprop](https://github.com/chemprop/chemprop.git)  software
This version of singularity container is based on the chemprop (v1.3.1) software which is slightly modified to compute cindex and is also compatible with tensorflow.

### Build singularity image

All dependent conda/pip packages needed for chemprop software are  compiled in environment.yaml file which is a slightly modified version of yaml file as availabe in the chemprop github repository. This is intended to work on GPU nodes on LUMI.

One can build singularity image using the following command:

```
sudo singularity build chemprop-lumi-multinode.sif Chemprop.def 

```
### (Alternatively) Download chemprop singularity image from allas
Download singularity image from allas object storage as below:
```
wget https://a3s.fi/chemprop_singularity/chemprop_lumi.tar.gz
tar -xavf chemprop_lumi.tar.gz
cd chemprop
```

### Testing chemprop singularity container on GPU node

Access interactive GPU node ('small-g' partition) on LUMI for testing chemprop as below:

```bash
srun --account=project_xxxxx --gpus-per-node=1 --partition=small-g --time=02:30:00 --nodes=1  --pty bash
rocm-smi
```

Test if pytorch/tensorflow is loaded properly inside of container on GPU node

```
singularity exec chemprop-lumi-multinode.sif bash
python3  # invoke python terminal
import torch
import tensorflow as tf
tf.config.list_physical_devices('GPU')
#use control+D to come out of python terminal and then 'exit' command to come out of container

```

Finally test containerised chemprop software with a small dataset which is included in the allas dump

```
# cd chemprop_test
singularity exec -B $PWD chemprop-lumi-multinode.sif chemprop_train --data_path data/lipo.csv --dataset_type regression --save_dir lipo_checkpoints --extra_metrics cindex --gpu 0
```
One can track the GPU load by accessing computing node:
```bash
srun --interactive --pty --jobid=xxxxx bash
rocm-smi
```
