# remove all installations from home: rm -fr ~/.local/*
export TMPDIR="/scratch/project_xxxx/$USER/chemprop/tmp"
export LOCAL_HOST="/scratch/project_xxxx/$USER/chemprop/tmp"
module load git
module load purge
module load tykky
mkdir -p /projappl/project_xxxx/$USER && mkdir -p /projappl/project_xxxx/$USER/chemprop
conda-containerize new --mamba  --prefix  /projappl/project_xxxx/$USER/chemprop chemprop.yml
