# BET Workflow with Singularity on Mahti

Follow our [CSC instructions](https://docs.csc.fi/computing/connecting/ssh-keys/) to login to Mahti and navigate to the /scratch area of your project.  This tutorial offers an interactive way of running the example job based on the instructions [from BIDS containers](https://neuroimaging-core-docs.readthedocs.io/en/latest/pages/bids_containers.html#betcontainer). When jobs get intensive due to large datasets, please use batch jobs instead. **Note** that this tutorial is based on CPU-based container which would also work smoothly on LUMI.

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

When pulling bigger images from container registries, /tmp or $HOME directories can be quickly filled up. Reset default lcoations of Singularity to use the current working directory for temporary and cache files.
```bash
export SINGULARITY_TMPDIR=$PWD
export SINGULARITY_CACHEDIR=$PWD
```
### Step 4: Build the Container from Docker
Pull the BET image from dockerHub as below:
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
