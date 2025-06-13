# Deploying a BioBB Notebook Application on LUMI Open OnDemand (OoD)
This document serves as a practical guide or "recipe" for porting a BioBB Jupyter Notebook application to the LUMI Open OnDemand (OoD) environment. The example used here is from [Protein MD Setup tutorial](https://github.com/bioexcel/biobb_wf_md_setup). LUMI OoD applications/Notebooks are based on module environments (or binary paths) created on LUMI.  

LUMI OoD applications are typically based on module environments or explicitly defined binary paths. These can originate from a container image (e.g., Singularity/Docker) or an environment specification (e.g., environment.yaml).

### 1. Build or Use a an Existing Container

A container for the biobb_wf_md_setup notebook can be built from an existing environment.yaml file.

The example uses [this environment YAML](https://github.com/bioexcel/biobb_wf_protein-complex_md_setup/blob/2f863bd07732cb7b52200f50499e0771c95a60a7/conda_env/environment.yml) to build a Singularity image as below:

```
singularity build --fakeroot biobb_wf_md_setup.sif biobb_wf_md_setup.def
```
The corresponding Singularity definition file (biobb_wf_md_setup.def) is available in the repository.

Alternatively, download the prebuilt container directly from Allas object storage:
```
wget https://a3s.fi/biobb/biobb_wf_md_setup.sif
```

### 2.  Install the BioBB MD Setup on LUMI Using the Container Image

Use CSC's [lumi-container-wrapper](https://docs.csc.fi/computing/containers/tykky/) (AKA., tykky) tool to wrap the container and make it usable within LUMI’s module system:

```
module load purge
module load LUMI
module load lumi-container-wrapper
mkdir /projappl/project_465001676/yetukuri/biobb_md
wrap-container -w /opt/conda/envs/biobb_wf_md_setup_env/bin biobb_wf_md_setup.sif --prefix /projappl/project_465001676/yetukuri/biobb_md
```
The above container wrapper command will install the software in the path : /projappl/project_465001676/yetukuri/biobb_md.

### 3. Create a .lua Module File for OoD

Create a .lua module file corresponding to your application. An example file (biobb_wf_md.lua) is provided in the GitHub repository. You can also refer to the default resource files in the same directory.

### 4. Launch the installed Jupyter notebook from the Puhti web interface

1. Login to [LUMI web interface](https://www.lumi.csc.fi) via CSC/HAKA/VIRTU credentials 
2. Once login is successful, select "Interactive Sessions" on the top menu bar and then click "Jupyter for courses". On the right-hand side you can see the different fields for selection before launching a job. Here, the Gromacs MD set up is now available under “Jupyter for courses” ( under our project_46200007/ lumi user support project and module “biobb_wf_md”) in LUMI web interface
3. Upon successful launching a job, you can click on "Connect to Jupyter" to see the course notebook corresponding to your course environment 

