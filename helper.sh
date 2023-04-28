clean name sof images/folder:
```
for file in *' '*; do [ -f "$file" ] && mv "$file" "`echo $file|tr -d '[:space:]'`"; done

````
update pluggins:
```
sudo singularity build --sandbox  fiji fiji_decon_plugins.sif 
sudo singularity shell --writable  fiji
ImageJ-linux64 --update add-update-site CSBDeep https://sites.imagej.net/CSBDeep/
ImageJ-linux64 --update add-update-site StarDist https://sites.imagej.net/StarDist/
sudo singularity build fiji_decon_plugins_StarDist.sif fiji
```
