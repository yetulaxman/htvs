# Optimise batch script(s) for pre-processing of large amounts of ligand data available in public databases such as ZINC and Pubchem.

## Simple parallelisation


```
git clone https://github.com/yetulaxman/htvs.git
cd htvs
sbatch htvs_parallel.sh

```

to view the resuts

```
ls -l data/*.mae
```

## Nextflow approach


```
git clone https://github.com/yetulaxman/htvs.git
cd htvs
sbatch job_nf.sh 
```

to view the resuts

```
ls -l results_mae/
```
