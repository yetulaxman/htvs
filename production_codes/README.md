### Helper scripts for pre-processing of Enamine REAL database on Mahti

### Configure schrodinger.hosts file
Make sure to configure your schrodinger.hosts file in your **job directory** where you submit your batch job on Mahti. In the hosts file, *tmpdir* path in localhost  must be set to ram directory (i.e., /dev/shm) in production environement. Please check example hosts file in current github folder for more details.


### Prepare job directories 
Organising job folders is a good idea to manage resulting files as well as error handling later if needed. Split REAL ENAMINE DB files into 10M chunks (Only one example file is provided in script, follow similar splitting for  the rest of Enamine REAL db files) and create a folder for each chunk. Inside of each job folder, SMILES input file needed for each job is created under the directory, data_SMILES.  Run bash script as below for job preparation:
```
bash prepare_jobs.sh # normal job submission is commented in script and use array job script instead.

```
### Array job script for submitting fixed number of simultaneous jobs on Mahti

We may have constraints on running number of concurrent jobs that we can run on Mahti. So, use array job script to submit all jobs while controling  the number simultaneous jobs that are actually running.  This example script submits 8 jobs of which two will be running at a time. See more details on array jobs at [CSC docs page](https://docs.csc.fi/computing/running/array-jobs/). Submit array job as below:

```
sbatch htvsprep_production_pipeline_array_Mahti.sh. # change total number of jobs overall and maximum number of concurrent jobs as needed

```
