#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=40
#SBATCH --cpus-per-task=1 # 40
#SBATCH --time=15:10:10 # 40:00:00
#SBATCH --account=project_xxxx

module load maestro parallel

find /scratch/project_xxxx/yetukuri/results_1000k_splits  -name '*.smi' | \
parallel -j 38 bash ${SLURM_SUBMIT_DIR}/wrapper_ligprep_pipeline.sh {} 
