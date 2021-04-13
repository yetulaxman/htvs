#!/bin/bash
# $1 is absolute input file path,../scratch/projects../... 
fpath=${1%/*}
fname=`basename $1`
file=$(echo $fname | cut -d'.' -f 1) # file name without extension to create output dir with the name
INPUT_SMILES="$fpath/$fname"

echo $INPUT_SMILES

PHASE_DB="$fpath/$file.phdb"
output=$fpath/$file
mkdir -p $output

# Place the actual app commands here...
cp template.inp $output &&  cd $output
# NOTE: Do *NOT* add file extension as phase_database will add it automatically (.sdfgz)
OUTPUT_SDF="$output"
TMPINP=`mktemp phase_inputXXXX.inp`
CPU_COUNT=1 # change this cautiously in production...

sed -e "s:INPUT_SMILES:$INPUT_SMILES:" -e "s:PHASE_DB:$PHASE_DB:" template.inp >$TMPINP
"${SCHRODINGER}/pipeline" -prog mydb $TMPINP -OVERWRITE -HOST localhost:1 -NJOBS 1 -WAIT 
#"${SCHRODINGER}/pipeline" -prog mydb $TMPINP -OVERWRITE -HOST localhost:$CPU_COUNT -NJOBS $CPU_COUNT -WAIT -NOJOBID
#$SCHRODINGER/phase_database $PHASE_DB export -osd $OUTPUT_SDF -get 1 -limit 10000000 -WAIT

