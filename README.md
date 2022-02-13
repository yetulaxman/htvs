### Image Analysis with Fiji/ImageJ Singularity Container (WIP)

[Fiji/ImageJ](https://imagej.net/software/fiji/) is open source software with pre-cpnfigured plugins to facilitate scientific image analysis and users can consult more [authoritative documentation](https://imagej.net/learn/) for its usage.

### Building a Singularity Image of Fiji/ImageJ for HPC Usage

Fiji/ImageJ software and its dependent plugins are included in the container version. This is intended to work on CPU nodes on CSC HPC systems. Container is tested on Puhti and can be used in Mahti/LUMI.

One can build singularity image using the following command:

```bash
sudo singularity build fiji_image.sif fiji-imageJ.def

```
Please note that  a user of the software does not need to build a new image unless one needs to have a latest version or different plugins of the software are need. One can simply use the existing container image instead as available in CSC [allas object storage](https://docs.csc.fi/data/Allas/) as described in the later section.

## Tools/Plugins in Fiji/ImageJ container

- [Fiji/ImageJ](https://downloads.imagej.net/fiji/latest/)
- DeconvolutionLab
    - [v2-2](http://bigwww.epfl.ch/deconvolution/deconvolutionlab2)
- Plugins 
    - TransformJ (v4.1.0)
    - FFW
- Utility tools
    - x-window-system
    - unzip
    - wget
    - others


## Log in to Puhti using SSH

In order to login to Puhti supercomputer, one has to have [CSC account](https://docs.csc.fi/accounts/how-to-create-new-user-account/) and have access to [Puhti service](https://docs.csc.fi/accounts/how-to-add-service-access-for-project/) under a project. Depending on your opertaing system of your workstation, please follow the instructions for connecting with SSH-client as described in [docs page](https://docs.csc.fi/computing/connecting/). For example, Linux workstations typically have SSH installed and one can simply open a terminal to issue the following command:

```bash
ssh yourcscusername@puhti.csc.fi
```
> Note: 

 - If you're connecting to Puhti for the first time, SSH client will ask you whether you trust the authenticity of the host. You need to accept for the first time.
 - For light-weight graphic rendering, use X11-tunneling to your ssh-connection (On Mac and Linux) by adding `-X` or `-Y` to your command (on Windows, MobaXterm actually will tunnel the connection). For heavy graphic usage, you can consider using [Puhti web interface](https://docs.csc.fi/computing/webinterface/) or [Nomachine](https://docs.csc.fi/apps/nomachine/). 
 - if you are windows user and wondering an easy way to login to Puhti, you can use [Puhti web interface](https://www.puhti.csc.fi/public/login.html). Once you are successfully logged in to Puhti web interface, navigate to `Tools` in menu bar and then click  `login node shell`

You can deploy your job as an interactive or batch job as shown below:
 
### Option 1: Deploying ImageJ/Fiji on Puhti as an interactive job 

Navigate to the scratch directiory on Puhti

```
cd  /scratch/project_xxxxx/
```

Download singularity Fiji/Imagej image from allas object storage as below:

```bash
# Download singularity image from allas object storage
wget https://a3s.fi/Fiji/fiji_tutorial.tar.gz
tar -xavf fiji_tutorial.tar.gz
```

Launch  ImageJ/Fiji software in an interactive node as below:

```bash
# start interactive node as below and choose your project name on prompt
sinteractive  -c 4 -m 12000    # this will ask you to choose one project, choose project no.
                               # resource allocation is usually faster but may take sometime if interactive nodes are under heavy use
```
Launch Fiji/Imagej container for analysis

```bash
cd fiji_tutorial
b="WellC003@/scratch/project_xxxxx/fiji_tutorial/2019-02-27_001@10"    # replace correct project number for `project_xxxxx` in the path
singularity_wrapper exec fiji_decon_plugins.sif  ImageJ-linux64 --headless --console -macro ./HeadlessDeconPassedPaths.ijm $b

```

### Option 2:  Deploying ImageJ/Fiji  on Puhti as a batch job 

Download singularity image from allas object storage as before

```bash
cd /scratch/project_xxxx/     # replace correct project number here
# Download singularity image from allas object storage
wget https://a3s.fi/Fiji/fiji_tutorial.tar.gz
tar -xavf fiji_tutorial.tar.gz
cd fiji_tutorial

```

You can copy the following script to a file e.g., imagej.sh. Make sure to use proper project name in `imagej.sh` file (i.e., use your correct project number for  `project_xxxx` in 1) SBATCH directives for `--account` value and 2) `b` parameter )   

```bash
#!/bin/bash
#SBATCH --job-name=myTest
#SBATCH --account=project_xxxx
#SBATCH --time=02:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --partition=small

b="WellC003@/scratch/project_xxxx/fiji_tutorial/2019-02-27_001@10"
singularity_wrapper exec fiji_decon_plugins.sif ImageJ-linux64 --headless --console -macro ./HeadlessDeconPassedPaths.ijm $b                           
```
submit your job 

```bash
sbatch imagej.sh
```
You can check your job status using the following command:

```
squeue -l -u $USER
```
This test case example would take about 10 minutes. 
