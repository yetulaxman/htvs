
webiste for LUMI OoD:
https://github.com/bioexcel/biobb_wf_md_setup

Build container on Puhti:

```
Bootstrap : docker
From :  continuumio/miniconda3
IncludeCmd : yes

%labels
AUTHOR email@email.com

%files
environemnt.yml

%post
apt-get update && apt-get install -y procps && apt-get clean -y
/opt/conda/bin/conda env create -n biobb_wf_md_setup_env -f /environemnt.yml
/opt/conda/bin/conda clean -a

%environment
export PATH=/opt/conda/bin:$PATH
. /opt/conda/etc/profile.d/conda.sh
conda activate biobb_wf_md_setup_env

%runscript
echo "This is an example script for building singularity/appatainer image"
```
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

