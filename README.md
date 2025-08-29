# BET Workflow with Singularity on Mahti

Following example from https://neuroimaging-core-docs.readthedocs.io/en/latest/pages/bids_containers.html#betcontainer, here is a small tutorial that would work e.g., on Mahti.   CPU-based container can perhaps work smoothly
also on LUMI.

### Step 1: Download and Extract the Dataset
```bash
wget https://osf.io/download/yz68t
unzip yz68t
```
### step 2: Start an Interactive HPC Session on Mahti
```bash
sinteractive -c 32  # Launches an interactive shell on a compute node with 32 cores.
```

### Step 3: Set Singularity Cache and Temp Directories
```bash
export SINGULARITY_TMPDIR=$PWD
export SINGULARITY_CACHEDIR=$PWD
```
### Step 4: Build the Container from Docker

```bash
singularity build bet.sif docker://bids/example
```
### Step 5: Move the Container Image 

```bash
mv bet.sif MRIS/
```

### Step 6: Run Participant-Level Processing

```bash
singularity run --cleanenv \
  --bind ${PWD}/Nifti:/data:ro \
  --bind ${PWD}/derivatives:/outputs \
  ./bet.sif /data /outputs participant --participant_label 219
```
### Step 7: Run Group-Level Processing

```bash
singularity run --cleanenv \
  --bind ${PWD}/Nifti:/data:ro \
  --bind ${PWD}/derivatives:/outputs \
  bet.sif /data /outputs group

```
### Step 8: Check Output
```bash
 ls derivatives/
```
