# BET Workflow with Singularity on Mahti


### Step 1: Download and Extract the Dataset
```bash
wget https://osf.io/download/yz68t
unzip yz68t
```
### step 2: Start an Interactive HPC Session
```bash
sinteractive -c 32  # Launches an interactive shell on a compute node with 32 cores.
```

### Step 3: Set Singularity Cache and Temp Directories
```bash
export SINGULARITY_TMPDIR=$PWD
export SINGULARITY_CACHEDIR=$PWD
```
### Step 4: (Optional) Build the Container from Docker

```bash
singularity build bet.sif docker://bids/example
```
### Step 5: Move the Container Image (Optional)

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
