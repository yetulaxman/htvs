# here is an example split with one DB file and follow the same for other files as well,
split -l 10000000 -d -a 1  --additional-suffix=.smi Enamine_REAL_lead-like_randomized_00.smi  Enamine_REAL_file_1_part
# make sure that original DB files are not present in this directory otherwise, jobs will be created for original DB file
mkdir -p temp && mv Enamine_REAL_lead-like_randomized* temp
if [ -f directories.txt ]; then   rm directories.txt ; fi
touch directories.txt # add folder names to a file for submitting jobs later
for filename in *.smi; do
    dir=$(echo $filename | cut -d'.' -f 1)
    mkdir -p $dir && mkdir -p $dir/data_SMILES
    echo $dir >> directories.txt
    cp  $filename $dir/data_SMILES
    cp  htvsprep_production_pipeline_Mahti.sh $dir/
    cd $dir
    echo $PWD    
  #  bash htvsprep_production_pipeline_all_steps.sh  data_SMILE/$filename  # don't submit now use array job scripts instead.
    cd -
done
