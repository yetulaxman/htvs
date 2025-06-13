## Deploying a BioBB Notebook Application on LUMI Open OnDemand (OoD)
This is a rough guide or "recipe" for porting a BioBB Jupyter Notebook application to the LUMI Open OnDemand (OoD) environment. The example used here is from [Protein MD Setup tutorial](https://github.com/bioexcel/biobb_wf_md_setup). LUMI OoD applications/Notebooks are based on module environments (or binary paths) created on LUMI.  

### 1. Build or Use an Existing Container

A container image (singularity) for the biobb_wf_md_setup notebook can be built from an existing environment.yaml file.

The example uses [this environment YAML](https://github.com/bioexcel/biobb_wf_protein-complex_md_setup/blob/2f863bd07732cb7b52200f50499e0771c95a60a7/conda_env/environment.yml) to build a Singularity image on Puhti as below:

```
singularity build --fakeroot biobb_wf_md_setup.sif biobb_wf_md_setup.def
```
The mentioned Singularity definition file (biobb_wf_md_setup.def) is available in the repository. The above command creats a singularity image: biobb_wf_md_setup.sif

Alternatively, download the prebuilt container directly from Allas object storage:
```
wget https://a3s.fi/biobb/biobb_wf_md_setup.sif
```

**Note:**: If the image is available as a docker image on container registry, one can skip this step (1) and proceed to step 2

### 2.  Install BioBB MD Setup on LUMI Using the Container Image

Use CSC's [lumi-container-wrapper](https://docs.csc.fi/computing/containers/tykky/) (aka, tykky wrapper) tool on LUMI to install and make it usable as a module:

```
module load purge
module load LUMI
module load lumi-container-wrapper
mkdir /projappl/project_465001676/yetukuri/biobb_md
wrap-container -w /opt/conda/envs/biobb_wf_md_setup_env/bin biobb_wf_md_setup.sif --prefix /projappl/project_465001676/yetukuri/biobb_md
```
The above container wrapper command will install the software under the path : /projappl/project_465001676/yetukuri/biobb_md.  Please note that if the image needs to be pulled from container registry, please provide full URL of image ( docker://...)

### 3. Create a .lua Module File for OoD

Create a .lua module file corresponding to your application under the path: /projappl/project_462000007/www_lumi_modules/. An example file (biobb_wf_md.lua) is provided in the GitHub repository. You can also refer to the default resource files in the same directory on LUMI.

### 4. Launch the installed Jupyter notebook from the LUMI web interface

1. Login to [LUMI web interface](https://www.lumi.csc.fi) via CSC/HAKA/VIRTU credentials 
2. Once login is successful, select "Interactive Sessions" on the top menu bar and then click "Jupyter for courses".  Here, the Gromacs MD set up is now available under “Jupyter for courses” (select the project, project_xxxxx and module “biobb_wf_md”) among other options.
3. Upon successful launching a job, you can click on "Connect to Jupyter" to see the course notebook corresponding to BioBB/Gromacs MD set up

