[yetukuri@mahti-login1 ~]$ cd /scratch/project_2004075/yetukuri/individual_jobs/1000k_noprepsplits/localhost_127_NJOBS_10M_modified_3302
[yetukuri@mahti-login1 localhost_127_NJOBS_10M_modified_3302]$ ls
data_SMILES			    Enamine_REAL_file_2_part1.maegz		       Enamine_REAL_file_2_part1_phase_splice.log	     Enamine_REAL_file_2_part1_revise_errors.out  htvsprep_production_pipeline_all_steps.sh
Enamine_REAL_file_2_part1_database  Enamine_REAL_file_2_part1_phase_splice_errors.out  Enamine_REAL_file_2_part1_phase_splice_new_phase.inp  Enamine_REAL_file_2_part1_revise.log	  ligprep_3302
Enamine_REAL_file_2_part1.log	    Enamine_REAL_file_2_part1_phase_splice.list        Enamine_REAL_file_2_part1_phase_splice.okay	     Enamine_REAL_file_2_part1_revise.okay	  slurm_all_individul-564231.out
[yetukuri@mahti-login1 localhost_127_NJOBS_10M_modified_3302]$ cp *.log /local_scratch/asillanp/
[yetukuri@mahti-login1 localhost_127_NJOBS_10M_modified_3302]$ chmod o+rw /local_scratch/asillanp/*.log
[yetukuri@mahti-login1 localhost_127_NJOBS_10M_modified_3302]$ ls -l /local_scratch/asillanp/
total 4631816
-rw-rw----. 1 asillanp pepr_asillanp       5474 May 17 11:48 10M-ligprep.png
-rw-rw----. 1 asillanp pepr_asillanp       6002 May 24 14:20 10M_ramdisk.png
-rw-rw----. 1 asillanp pepr_asillanp       5986 May 24 15:09 10M_ramdisk_starttimes_ligp.png
-rw-rw----. 1 asillanp pepr_asillanp       5240 May 17 12:54 10M_revise.png
-rw-rw----. 1 asillanp pepr_asillanp       4688 May 17 12:55 10M_splice.png
-rw-rw----. 1 asillanp pepr_asillanp       2996 May 21 12:32 d_avail
-rw-rw----. 1 asillanp pepr_asillanp       1101 May 21 12:32 d_free
-rw-rw----. 1 asillanp pepr_asillanp       3496 May 21 12:33 d_jobs
-rw-rw----. 1 asillanp pepr_asillanp        141 May 21 12:33 d_used
-rw-rw-rw-. 1 yetukuri pepr_yetukuri 1100220695 May 24 15:31 Enamine_REAL_file_2_part1.log
-rw-rw-rw-. 1 yetukuri pepr_yetukuri    1270636 May 24 15:31 Enamine_REAL_file_2_part1_phase_splice.log
-rw-rw-rw-. 1 yetukuri pepr_yetukuri 1269588086 May 24 15:31 Enamine_REAL_file_2_part1_revise.log
-rw-rw-rw-. 1 yetukuri pepr_yetukuri 1100435231 May 24 13:14 Enamine_REAL_file_2_part2.log
-rw-rw-rw-. 1 yetukuri pepr_yetukuri    1270783 May 24 13:15 Enamine_REAL_file_2_part2_phase_splice.log
-rw-rw-rw-. 1 yetukuri pepr_yetukuri 1269789750 May 24 13:15 Enamine_REAL_file_2_part2_revise.log
-rw-rw-rw-. 1 yetukuri pepr_yetukuri      37037 May 17 11:30 ligprep
-rw-rw-rw-. 1 yetukuri pepr_yetukuri     122211 May 21 08:16 ligprep_3302
drwxrwxrwx. 4 yetukuri pepr_yetukuri       4096 May 21 14:35 localhost_127_NJOBS_127_modified
-rw-rw----. 1 asillanp pepr_asillanp       5097 May 21 09:56 loitsu.gnuplot
-rw-rw-rw-. 1 yetukuri pepr_yetukuri       8745 May 24 13:09 nouhp_1m.txt
drwxrwx---. 2 asillanp pepr_asillanp         51 May 17 15:42 oma
-rw-rw-rw-. 1 yetukuri pepr_yetukuri       3222 May 17 11:30 revise
-rw-rw-rw-. 1 yetukuri pepr_yetukuri       3222 May 17 11:30 splice
-rw-rw----. 1 asillanp pepr_asillanp     123395 May 24 14:10 t_lig
-rw-rw----. 1 asillanp pepr_asillanp       3442 May 24 14:13 t_rev
-rw-rw----. 1 asillanp pepr_asillanp       3247 May 24 14:18 t_spli
[yetukuri@mahti-login1 localhost_127_NJOBS_10M_modified_3302]$ cd ..
[yetukuri@mahti-login1 1000k_noprepsplits]$ ls
localhost_127_NJOBS_10M_modified       localhost_127_NJOBS_127		 localhost_127_NJOBS_5M_modified  production_tests  ramdisk_1M
localhost_127_NJOBS_10M_modified_3302  localhost_127_NJOBS_127_modified  localhost_127_NJOBS_635	  ramdisk_10M	    ramdisk_exp
[yetukuri@mahti-login1 1000k_noprepsplits]$ cd ramdisk_10M
[yetukuri@mahti-login1 ramdisk_10M]$ clear





[yetukuri@mahti-login1 ramdisk_10M]$ ls
array_job_err_567387_3.txt  Enamine_REAL_file_2_part0.smi  Enamine_REAL_file_2_part2.smi  Enamine_REAL_file_2_part4.smi  Enamine_REAL_file_2_part6.smi		    htvsprep_production_pipeline_array_Mahti.sh
array_job_out_567387_3.txt  Enamine_REAL_file_2_part1	   Enamine_REAL_file_2_part3	  Enamine_REAL_file_2_part5	 Enamine_REAL_file_2_part7		    prepare_jobs.sh
directories.txt		    Enamine_REAL_file_2_part1.smi  Enamine_REAL_file_2_part3.smi  Enamine_REAL_file_2_part5.smi  Enamine_REAL_file_2_part7.smi		    schrodinger.hosts
Enamine_REAL_file_2_part0   Enamine_REAL_file_2_part2	   Enamine_REAL_file_2_part4	  Enamine_REAL_file_2_part6	 htvsprep_production_pipeline_all_steps.sh  temp
[yetukuri@mahti-login1 ramdisk_10M]$ vi schrodinger.hosts 
[yetukuri@mahti-login1 ramdisk_10M]$ 
[yetukuri@mahti-login1 ramdisk_10M]$ vi htvsprep_production_pipeline_array_Mahti.sh 






































#!/bin/bash
#SBATCH --partition=medium
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128 # 40
#SBATCH --time=36:00:00 # 40:00:00
#SBATCH --account=project_2004075
#SBATCH --cpus-per-task=1
#SBATCH --output=array_job_out_%A_%a.txt
#SBATCH --error=array_job_err_%A_%a.txt
#SBATCH --array=3-3%1


module load exp/test-2021.1

export SCHRODINGER_TMPDIR=/dev/shm

cd ${SLURM_SUBMIT_DIR}
fname=$(sed -n "$SLURM_ARRAY_TASK_ID"p directories.txt)
cd $fname
echo "echo file name: $fname"

if [ -f "$fname"_phase_splice.list ]; then   rm "$fname"_phase_splice.list ; fi

touch "$fname"_phase_splice.list

echo ""$fname".maegz" >> "$fname"_phase_splice.list

mkdir -p "$fname"_database

$SCHRODINGER/ligprep -kp -retain  -lab -epik -W e,-ph,7.0,-pht,1.5,-ms,16 -i 2 -t 8 -s 4 -ismi  $PWD/data_SMILES/"$fname".smi -omae "$fname".maegz -HOST localhost:127 -NSTRUCT 3000 -JOBNAME Legprep_test -LOCAL -WAIT
$SCHRODINGER/phase_database $PWD/"$fname"_database/"$fname".phdb splice "$fname"_phase_splice.list  -new -fmt int  -JOB "$fname"_phase_splice -HOST localhost:127  -WAIT
$SCHRODINGER/phase_database $PWD/"$fname"_database/"$fname".phdb revise "$fname"_revise -confs auto -max 1 -sample rapid -HOST localhost:127 -WAIT
~                                      
