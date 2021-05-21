#!/bin/bash
#SBATCH --partition=medium
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128 # 40
#SBATCH --time=36:00:00 # 40:00:00
#SBATCH --account=project_2004075
#SBATCH --cpus-per-task=1
#SBATCH  --output=slurm_all_individul-%A.out

module load exp/test-2021.1

# $1 is absolute/relative input file path
fbase=`basename $1`
fname=$(echo $fbase | cut -d'.' -f 1) # file name without extension to create output dir with the name

if [ -f "$fname"_phase_splice.list ]; then   rm "$fname"_phase_splice.list ; fi

touch "$fname"_phase_splice.list

echo ""$fname".maegz" >> "$fname"_phase_splice.list

mkdir -p "$fname"_database

$SCHRODINGER/ligprep -kp -retain  -lab -epik -W e,-ph,7.0,-pht,1.5,-ms,16 -i 2 -t 8 -s 4 -ismi ${SLURM_SUBMIT_DIR}/data_SMILES/"$fname".smi -omae "$fname".maegz -HOST localhost:127 -NSTRUCT 3000 -JOBNAME Legprep_test -LOCAL -WAIT
$SCHRODINGER/phase_database ${SLURM_SUBMIT_DIR}/"$fname"_database/"$fname".phdb splice "$fname"_phase_splice.list  -new -fmt int  -JOB "$fname"_phase_splice -HOST localhost:127 -WAIT
$SCHRODINGER/phase_database ${SLURM_SUBMIT_DIR}/"$fname"_database/"$fname".phdb revise "$fname"_revise -confs auto -max 1 -sample rapid -HOST localhost:127 -WAIT
