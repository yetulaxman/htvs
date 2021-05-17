#!/bin/bash
#SBATCH --partition=small
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20 # 40
#SBATCH --time=00:15:00 # 40:00:00
#SBATCH --account=project_2004075
#SBATCH --cpus-per-task=1
#SBATCH --output=array_job_out_%A_%a.txt
#SBATCH --error=array_job_err_%A_%a.txt
#SBATCH --array=1-7%2

module load maestro
cd ${SLURM_SUBMIT_DIR}
fname=$(sed -n "$SLURM_ARRAY_TASK_ID"p directories.txt)
cd $fname
echo "echo file name: $fname"

if [ -f "$fname"_phase_splice.list ]; then   rm "$fname"_phase_splice.list ; fi

touch "$fname"_phase_splice.list

echo ""$fname".maegz" >> "$fname"_phase_splice.list

mkdir -p "$fname"_database

$SCHRODINGER/ligprep -kp -retain  -lab -epik -W e,-ph,7.0,-pht,1.5,-ms,16 -i 2 -t 8 -s 4 -ismi  $PWD/data_SMILES/"$fname".smi -omae "$fname".maegz -HOST localhost:20 -NSTRUCT 500 -JOBNAME Legprep_test -LOCAL -WAIT
$SCHRODINGER/phase_database $PWD/"$fname"_database/"$fname".phdb splice "$fname"_phase_splice.list  -new -fmt int  -JOB "$fname"_phase_splice -HOST localhost:20  -WAIT
$SCHRODINGER/phase_database $PWD/"$fname"_database/"$fname".phdb revise "$fname"_revise -confs auto -max 1 -sample rapid -HOST localhost:20 -WAIT
