import yaml
import os
import subprocess
import sys
args = sys.argv
sdir = "."
outdir = "."
files = os.listdir(path=sdir)

d = open('docker-compose.yml')
d2 = yaml.safe_load(d)
for k in d2['services'].keys():
    if 'ppca' not in k:
        subprocess.call([ 'echo', 'singularity', 'build', '' + k + '.sif', 'images/' + k + '/Singularity.def'])
        subprocess.call([ 'sudo', 'singularity', 'build', '' + k + '.sif', 'images/' + k + '/Singularity.def'])
        subprocess.call([ 'echo', 'singularity', 'push', '-U', '' + k + '.sif', 'library://mattocci27/default/' + k.replace('_', ':') ])
        subprocess.call([ 'singularity', 'push', '-U', '' + k + '.sif', 'library://mattocci27/default/' + k.replace('_', ':') ])