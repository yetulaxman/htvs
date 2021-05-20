### Helper scripts for preprocessing of Enamine REAL database on Mahti

### Configure Schrondinger.hosts file
Make sure to configure your Scrondinger.hosts file in your home directory on Mahti. In the hosts file, *tmpdir* in localhost must be set to scratch directory to avoid errors (e.g., job fizzled issues) in production environement. Please check example hosts file in current github folder for more details.


### Prepare job directories 
Split REAL ENAMINE DB files into 10M chunks and create a folder for each chunk. Inside of each folder, SMILES input file needed for job is created under the folder, data_SMILES.  
```
bash prepare_jobs.sh # normal job submission is commented and use array job instead.

```
### Array job for submitting fixed number of simultaneous jobs on Mahti

We may have constraints on running number of concurrent jobs that we can submit on Mahti. So, use array job script to submit all jobs while controling  the number simultaneous jobs that are actually running.  This scripst submits seven job of whcih two will be running at a time. See more details on array jobs [CSC docs page](https://docs.csc.fi/computing/running/array-jobs/)

```
sbatch htvsprep_production_pipeline_array_Mahti.sh. # change the number of jobs 
```

### Test case: Run production code with 10M records on Mahti

```
sbatch htvs_pipeline_all_steps_test_10M.sh

```

### Automation: Run all SMILES records in one Enaamine Real db file (~78 M) by splitting into 10M records a file and submitting each batch job for processing each split

```
bash prepare_jobs.sh # presently, job submission is commented
```
