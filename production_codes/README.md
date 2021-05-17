## Test case: Run production code with 10M records on Mahti

```
sbatch htvs_pipeline_all_steps_test_10M.sh

```

## Automation: Run all all the records in one Enaamine Real db file (~78 M) by splitting 10M a file and submit batch jobs for processing each split separately
## presently job submission is commented on the script
```
bash prepare_jobs.sh

```
