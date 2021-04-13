module load maestro 
rm script_file.sh   # or if [ -f script_file.sh ]; then   rm script_file.sh; fi
touch script_file.sh
for filename in /scratch/project_2004075/yetukuri/htvs_serial/data_SMILES2/*smi; do
    echo $filename
    bash wrapper_ligprep_pipeline.sh $filename
done
