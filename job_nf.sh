#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=2                 # 40
#SBATCH --time=00:10:10                   # 40:00:00
#SBATCH --mem=10G                          # 160G
#SBATCH --account=project_2002389


module load maestro
module load bioconda
source activate nextflow

nextflow run  test_real.nf

