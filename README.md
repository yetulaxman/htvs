# Optimise HTVS workflows
Optimise batch script(s) for pre-processing of large amounts of ligand data available in public databases such as ZINC and Pubchem etc.

## simple test case with parallelisation


```
git clone https://github.com/yetulaxman/htvs.git
cd htvs
sbatch htvs_parallel.sh

```

to view the resuts

```
ls -l data/*.mae
```
> Note: This batch script can also  work if you request local fast drive in slurm directives(--gres=nvme:10) 
## simple test case with  Nextflow approach


```
git clone https://github.com/yetulaxman/htvs.git
cd htvs
sbatch job_nf.sh 
```

to view the resuts

```
ls -l results_mae/
```
