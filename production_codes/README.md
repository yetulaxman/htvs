### Helper scripts for preprocessing of Enamine REAL database on Mahti

### Configure Schrondinger.hosts file
Make sure to configure your Scrondinger.hosts file in your home directory on Mahti. In the hosts file, *tmpdir* must be set to scratch to avoid errors (e.g., job fizzled issues) in production environement. Please check example hosts file in the current github folder for more details.


### Prepare job directories 
Split REAL ENAMINE DB files into 10M chunks and create a folder for each  chunk. Inside the each folder, SMILES file is placed under the folder, data_SMILES. The script  
```
bash prepare_jobs.sh 
```
### Test case: Run production code with 10M records on Mahti

```
sbatch htvs_pipeline_all_steps_test_10M.sh

```

### Automation: Run all SMILES records in one Enaamine Real db file (~78 M) by splitting into 10M records a file and submitting each batch job for processing each split

```
bash prepare_jobs.sh # presently, job submission is commented
```
### Array job for submitting fixed number of simultaneous jobs on Puhti/Mahti

We may have constraints on number of jobs that we can submit on Mahti. So, use array job script to submit all jobs while controling  the number simultaneous jobs that are actually running. 

```
bash prepare_jobs.sh
sbatch htvsprep_production_pipeline_array_Mahti.sh. # change the number of jobs 
```
