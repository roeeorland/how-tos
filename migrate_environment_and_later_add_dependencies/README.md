
1. Create virtual environment

2. Create requirements.txt file

3. Activate environment

## Downloading the modules locally:

pip download  -r requirements.txt(or module name without the -r flag) -d /path/to/download/dir

zip the folder with the modules, as well as the virtual environment itself

on the target computer unzip 

activate the environment

pip install --no-index --find-links=<path to dir with the modules> -r requirements.txt