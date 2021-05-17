## Helper scripts for preprocessing of Enamine REAL DB on Mahti
make sure to configure your scrondinger.hosts file. For localhost setting, *tmpdir* must be set to scratch to avoid errors (e.g., job fizzled issues) in production environement.

### Test case: Run production code with 10M records on Mahti

```
sbatch htvs_pipeline_all_steps_test_10M.sh

```

### Automation: Run all the records in one Enaamine Real db file (~78 M) by splitting 10M a file and submit batch jobs for processing each split separately
### presently job submission is commented in the script
```
bash prepare_jobs.sh
```
### array job for submitting fixed number of simultaneous jobs on Puhti/Mahti

We may have constraints on number of jobs that we can submit on Mahti. So, use array job script to control the number jobs that are actually running. 

```
sbatch 
