split -l 10000000 -d -a 1  --additional-suffix=.smi Enamine_REAL_lead-like_randomized_00.smi  Enamine_REAL_file_1_part
mkdir -p temp && mv Enamine_REAL_lead-like_randomized* temp
rm directories.txt && touch directories.txt
for filename in *.smi; do
    dir=$(echo $filename | cut -d'.' -f 1)
    mkdir -p $dir && mkdir -p $dir/data_SMILES
    echo $dir >> directories.txt
    cp  $filename $dir/data_SMILES
    cp  htvsprep_production_pipeline_all_steps.sh $dir/
    cd $dir
    echo $PWD    
  #  bash htvsprep_production_pipeline_all_steps.sh  data_SMILE/$filename
    cd -
done
