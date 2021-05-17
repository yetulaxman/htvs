#!/bin/bash
#SBATCH --partition=medium
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128 # 40
#SBATCH --time=36:00:00 # 40:00:00
#SBATCH --account=project_2004075
#SBATCH --cpus-per-task=1
#SBATCH  --output=slurm_all_individul-%A.out

module load exp/test-2021.1

#export LC_ALL="en_US.UTF-8"

if [ -f test_phase_splice.list ]; then   rm test_phase_splice.list ; fi

touch test_phase_splice.list

echo "test10M.maegz" >> test_phase_splice.list

mkdir -p database

$SCHRODINGER/ligprep -kp -retain  -lab -epik -W e,-ph,7.0,-pht,1.5,-ms,16 -i 2 -t 8 -s 4 -ismi "$PWD/data_SMILES/test10M.smi" -omae test10M.maegz -HOST localhost:127 -NSTRUCT 10000 -JOBNAME Legprep_test -LOCAL -WAIT
$SCHRODINGER/phase_database ${SLURM_SUBMIT_DIR}/database/test10M.phdb splice test_phase_splice.list  -new -fmt int  -JOB test_phase_splice -HOST localhost:127 -TMPDIR $PWD -WAIT
$SCHRODINGER/phase_database ${SLURM_SUBMIT_DIR}/database/test10M.phdb revise test_revise -confs auto -max 1 -sample rapid -HOST localhost:127 -WAIT
