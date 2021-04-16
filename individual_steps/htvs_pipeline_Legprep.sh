#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1 # 40
#SBATCH --time=01:10:10 # 40:00:00
#SBATCH --account=project_2004075

module load maestro parallel

find $PWD/data_SMILES  -name '*.smi' | \
parallel -j 10 bash ${SLURM_SUBMIT_DIR}/wrapper_ligprep_pipeline_Ligprep.sh {} 
