#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=2 # 40
#SBATCH --time=00:10:10 # 40:00:00
#SBATCH --mem=1G # 160G
#SBATCH --account=project_2001659

module load maestro parallel  # load module

find $PWD/data_SMILES  -name '*.smi' | \
parallel -j 10 bash ${SLURM_SUBMIT_DIR}/wrapper_ligprep_pipeline.sh {}
#parallel -j $SLURM_CPUS_PER_TASK bash ${SLURM_SUBMIT_DIR}/wrapper_ligprep_pipeline.sh {}
