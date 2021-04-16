#!/bin/bash
# $1 is absolute input file path,../scratch/projects../... 
fpath=${1%/*}
fname=`basename $1`
file=$(echo $fname | cut -d'.' -f 1) # file name without extension to create output dir with the name
INPUT_SMILES="$fpath/$fname"

echo $INPUT_SMILES

PHASE_DB="$fpath/$file.phdb"
output=$fpath/$file
mkdir -p $output &&  cd $output

$SCHRODINGER/ligprep -kp -retain  -lab -epik -W e,-ph,7.0,-pht,2.0,-ms,16 -i 2 -t 4 -s 4 -ismi "$INPUT_SMILES".smi -omae "$file".maegz -HOST localhost:10 -JOBNAME Legprep_test -LOCAL -WAIT

