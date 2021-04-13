#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=40
#SBATCH --cpus-per-task=1 # 40
#SBATCH --time=15:10:10 # 40:00:00
#SBATCH --account=project_xxxx


module load maestro 
bash script_file.sh
