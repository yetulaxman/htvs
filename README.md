# Deploy a BioBB notebook application on LUMI Open OnDemand 
This is a rough notes or recipe for porting a BioBB notebook on LUMI OoD. The example BioBB notebook is from Protein MD Setup tutorial (https://github.com/bioexcel/biobb_wf_md_setup). 

LUMI OoD applications/Notebooks are based on module environments (or binary paths) created on LUMI.  The module files are located on /projappl/project_xxxx/www_lumi_modules/. There should be a .lua file corresponding to a application.

The OoD  application can be easily created from a existing container (either singularity or docker) or even from a pip/conda environment file (e.g., environment.yaml). For biobb_wf_md_setup, the [.yaml file](https://github.com/bioexcel/biobb_wf_protein-complex_md_setup/blob/2f863bd07732cb7b52200f50499e0771c95a60a7/conda_env/environment.yml)  was used to build a container as below on Puhti:

Build container on Puhti:


Get yaml file from here: https://github.com/bioexcel/biobb_wf_protein-complex_md_setup/blob/2f863bd07732cb7b52200f50499e0771c95a60a7/conda_env/environment.yml

build the container :

```
singularity build --fakeroot biobb_wf_md_setup.sif biobb_wf_md_setup.def
```

image is availbale here:
```
wget https://a3s.fi/biobb/biobb_wf_md_setup.sif
```

lua file:

```
-- Jupyter
prepend_path("PATH", "/projappl/project_465001676/yetukuri/biobb_md/bin")

setenv("_COURSE_BASE_NAME","biobb-wf")
setenv("_COURSE_NOTEBOOK","biobb_wf_md_setup/biobb_wf_md_setup/notebooks/biobb_wf_md_setup.ipynb")
setenv("_COURSE_GIT_REPO","https://github.com/bioexcel/biobb_wf_md_setup")
setenv("_COURSE_GIT_REF","")
setenv("_COURSE_NOTEBOOK_TYPE", "notebook")
```

tykky file on LUMI:
```
module load purge
module load LUMI
module load lumi-container-wrapper

mkdir /projappl/project_465001676/yetukuri/biobb_md
wrap-container -w /opt/conda/envs/biobb_wf_md_setup_env/bin biobb_wf_md_setup.sif --prefix /projappl/project_465001676/yetukuri/biobb_md
```

