## Singularity container for [chemprop](https://github.com/chemprop/chemprop.git)  software
This version of singularity container is based on the chemprop (v1.3.1) software which is slightly modified to compute cindex and is also compatible with tensorflow.

### Build singularity image

All dependent conda/pip packages needed for chemprop software are  compiled in environment.yaml file which is a slightly modified version of yaml file as availabe in the chemprop github repository. This is intended to work on GPU nodes on CSC HPC systems (Tested on Mahti and can work in Puhti/Lumi).

One can build singularity image using the following command:

```
sudo singularity build chemprop-v1.3.1-cindex.sif chemprop.def

```
### (Alternatively) Download chemprop singularity image from allas
Download singularity image from allas object storage as below:
```
wget https://a3s.fi/chemprop_singularity/chemprop_cindex.tar.gz
tar -xavf chemprop_cindex.tar.gz
cd chemprop
```

### Testing chemprop singularity container on GPU node

Access interactive GPU node ('gputest' partition) on Mahti for testing chemprop as below:

```
srun -A project_2004075 -p gputest --gres=gpu:a100:1,nvme:50 -t 15 -c 10 --mem 96G --pty bash
nvidia-smi
```

Test if pytorch/tensorflow is loaded properly inside of container on GPU node

```
export SING_IMAGE=$PWD/chemprop-1.3.1-tensorflow-cindex.sif
export SING_FLAGS="--nv"
singularity_wrapper exec bash
# singularity_wrapper exec --nv chemprop-1.3.1-tensorflow-cindex.sif bash
python3  # invoke python terminal
import torch
print(torch.cuda.is_available())
print(torch.version.cuda)

import tensorflow as tf
print(tf.test.gpu_device_name())
print(tf.config.get_visible_devices())

#use control+D to come out of python terminal and then 'exit' command to come out of container

```

Finally test containerised chemprop software with a small dataset which is included in the allas dump

```
# cd chemprop_test
singularity_wrapper exec chemprop_train --data_path data/lipo.csv --dataset_type regression --save_dir lipo_checkpoints --extra_metrics cindex --gpu 0

# singularity_wrapper exec --nv chemprop-1.3.1-tensorflow-cindex.sif chemprop_train --data_path data/lipo.csv --dataset_type regression --save_dir lipo_checkpoints --extra_metrics cindex --gpu 0

#singularity_wrapper exec --nv chemprop-1.3.1-tensorflow-cindex.sif chemprop_train --data_path data/lipo.csv --dataset_type regression --save_dir lipo_checkpoints --extra_metrics cindex_fast --gpu 0 

```

