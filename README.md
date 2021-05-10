## Installation of chemprop
check cuda version on GPU node

```
srun -A project_xxxx -p gputest --gres=gpu:v100:1,nvme:50 -t 15 -c 10 --mem 96G --pty bash
nvidia-smi
```

```
export PROJAPPL=/projappl/project_xxxx
git clone https://github.com/chemprop/chemprop.git
cd chemprop
module load bioconda

# order of channels is changed (pytorch in first place) and run on the gpu node (may not be necessary)
# change  - rdkit=v2021.03.1
# cudatoolkit-11.1;
# PyTorch = 1.8.0
# python=3.8
# this step was run in gpu node download an dinstalltion of software pip errors -> agina run on login node

conda env create -f environment.yml

conda activate chemprop
pip install -e .
```

## check if pytorch is working 

```
python3
import torch
print(torch.cuda.is_available())
print(torch.version.cuda)

```
## test GPU-version of chemprop
```
srun -A project_xxxx -p gputest --gres=gpu:v100:1,nvme:50 -t 15 -c 10 --mem 96G --pty bash
export PROJAPPL=/projappl/project_xxxx
module load bioconda
source activate chemprop
cd /scratch/project_xxxx/chemprop_test
chemprop_train --data_path data/tox21.csv --dataset_type classification --save_dir tox21_checkpoints --gpu 0
```
