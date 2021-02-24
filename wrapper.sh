#!/bin/bash

# $1 is relative path to input file, 'dir-NNN/input-NNN'
fpath=${1%/*}
fname=${1#*/}

# Full paths to parallel file system, '/scratch/...'
input=$PWD/$1
output=$PWD/$fpath
mkdir -p $output

# Change to local SSD disk
rundir=$LOCAL_SCRATCH/$fpath
mkdir -p $rundir && cd $rundir

# Prepare input
cp $input ./$fname

# Place the actual app here instead of the dummy commands...

file=$(echo $fname | cut -d'.' -f 1)
ligprep -isd $fname -omae $file.mae  -LOCAL -NOJOBID

# Move output from SSD to /scratch
rm $fname && mv "$file".mae  $output

