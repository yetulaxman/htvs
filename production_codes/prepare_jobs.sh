split -l 10000000 -d -a 1  --additional-suffix=.smi Enamine_REAL_lead-like_randomized_00.smi  Enamine_REAL_file_1_part
for filename in $PWD/*smi; do
    file=$(echo $filename | cut -d'.' -f 1)
    mkdir -p $file && mkdir -p $file/data_SMILES
    cp  $filename $file/data_SMILES
    cp  htvsprep_production_pipeline.sh $file/
    cd $file
    echo $PWD    
 #  bash htvsprep_production_pipeline.sh  data_SMILE/$filename
    cd -
done
