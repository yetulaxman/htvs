module load maestro 
rm script_file.sh
touch script_file.sh
for filename in /scratch/project_2004075/yetukuri/htvs_serial/data_SMILES2/*smi; do
    echo $filename
    bash wrapper_ligprep_pipeline.sh $filename
done
