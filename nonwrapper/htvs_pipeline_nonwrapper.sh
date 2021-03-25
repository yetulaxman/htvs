#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1 # 40
#SBATCH --time=01:10:10 # 40:00:00
#SBATCH --account=project_2001659

module load maestro parallel

"$SCHRODINGER/pipeline" -prog mydb phase_inputWnjC.inp -OVERWRITE -HOST localhost:4 -NJOBS 4 -WAIT
