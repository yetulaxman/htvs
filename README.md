## Singualarity container for [chemprop](https://github.com/chemprop/chemprop.git)  software
This version of singularity container is based on the chemprop v1.3.1 as available in [conda-forge](https://anaconda.org/conda-forge/chemprop/) channel.

### Build singularity image

All dependent conda/pip packages needed for chemprop software are  compiled in environment.yaml file which is a slightly modified version of yaml file as availabe in the chemprop github repository. This is intended to work on GPU nodes on Puhti.

One can build singularity image using the following command:

```
sudo singularity build chemprop_puhti_v1.3.1_final.sif chemprop.def

```
### (Alternatively) Download chemprop singularity image from allas
Download singularity image from allas object storage as below:
```
wget https://a3s.fi/chemprop_singularity/chemprop_test.tar.gz
tar -xavf chemprop_test.tar.gz 
cd chemprop_test
```

### Testing chemprop singularity container on GPU node

Access interactive GPU node ('gputest' partition) on Puhti for testing chemprop as below:

```
srun -A project_xxxx -p gputest --gres=gpu:v100:1,nvme:50 -t 15 -c 10 --mem 96G --pty bash
nvidia-smi
```

Test if pytorch is working properly on GPU node

```
python3
import torch
print(torch.cuda.is_available())
print(torch.version.cuda)

```

### Finally test with small dataset included in the allas dump

```
cd chemprop_test
singularity_wrapper exec --nv chemprop_puhti_v1.3.1_final.sif chemprop_train --data_path data/tox21.csv --dataset_type classification --save_dir tox21_checkpoints --gpu 0
```

```
