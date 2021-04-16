#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1 # 40
#SBATCH --time=01:10:10 # 40:00:00
#SBATCH --account=project_2004075

module load maestro parallel

ls /scratch/project_2004075/yetukuri/Individual_jobs/LigPrep/data/*.maegz > test_phase_splice.list 
$SCHRODINGER/phase_database /scratch/project_2004075/yetukuri/Individual_jobs/LigPrep/data/test.phdb splice test_phase_splice.list  -new -fmt int -nosplit -JOB test_phase_splice -HOST localhost:10 -WAIT
