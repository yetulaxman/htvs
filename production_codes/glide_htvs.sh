#!/bin/bash
#SBATCH --partition=medium
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128 # 40
#SBATCH --time=36:00:00 # 40:00:00
#SBATCH --account=project_2004075
#SBATCH --cpus-per-task=1
#SBATCH --output=glide_array_job_out_%A_%a.txt
#SBATCH --error=glide_array_job_err_%A_%a.txt
#SBATCH --array=1-1%1


module load exp/test-2021.1
export SCHROD_LICENSE_FILE="xxxx:xxxx"
export SCHRODINGER_TMPDIR="/dev/shm"
export SCHRODINGER_JOBDB2="/scratch/project_2004075/$USER/.schrodinger/.jobdb2"
"${SCHRODINGER}/glide" glide-surA_HTVS-vdW08_phase_test.in  -HOST localhost:127 -NJOBS 2540  -OVERWRITE -WAIT -nosplit
