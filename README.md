### [chemprop](https://github.com/tonisi/chemprop.git)  software instalaltion with Tykky wrapper

All dependent conda/pip packages needed for chemprop software are added in chemprop.yaml file which is a slightly modified version of yaml file as availabe in the chemprop github repository.

One can build container image using tykky in the following way:

```
cd /scratch/project_xxx/$USER/chemprop    # move to scratch area
sinteractive -c 32   # alternatively, you can use batch script. For bigger installations disk space error will be raised on login nodes.
bash install_chemprop.sh   
```

### Testing chemprop container on GPU node

Access interactive GPU node ('gputest' partition) on Mahti for testing chemprop as below:

```
srun -A project_xxxx -p gputest --gres=gpu:a100:1,nvme:50 -t 15 -c 10 --mem 96G --pty bash
nvidia-smi
```

Test if pytorch/tensorflow is loaded properly inside of container on GPU node

```
export PATH="/projappl/project_xxxx/$USER/chemprop/bin:$PATH"
python3  # invoke python terminal
import torch
print(torch.version.cuda)

import tensorflow as tf
print("Tensorflow version: ", tf.__version__)
# print(tf.test.gpu_device_name())  # this is not detected at the moment
# print(tf.config.get_visible_devices()) 

#use control+D to come out of python terminal and then 'exit' command to come out of container

```
Finally test containerised chemprop software with a small dataset which is included in the allas dump

```
wget https://a3s.fi/chemprop_singularity/data.tar.gz
tar -xavf data.tar.gz

chemprop_train --data_path data/lipo.csv --dataset_type regression --save_dir lipo_checkpoints --extra_metrics cindex --gpu 0
```

