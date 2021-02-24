#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20 # 40
#SBATCH --time=00:10:10 # 40:00:00
#SBATCH --mem=10G # 160G
#SBATCH --account=project_2001659

module load maestro parallel

find data  -name '*.sdf' | \
parallel -j $SLURM_CPUS_PER_TASK bash ${SLURM_SUBMIT_DIR}/wrapper.sh {}

##parallel -j $SLURM_CPUS_PER_TASK ::: "ligprep -isd test1.sdf -osd test1.sd -LOCAL -NOJOBID"  "ligprep -isd test2.sdf -osd test\
2.sd -LOCAL -NOJOBID"

