import yaml
import os
import subprocess
import sys
args = sys.argv 
MY_IP= args[1]
sdir = "."
outdir = "."
files = os.listdir(path=sdir)

d = open('docker-compose.yml')
d2 = yaml.safe_load(d)
for k in d2['services'].keys():
    subprocess.call([ 'echo', 'singularity', 'build', 'singularity/' + k + '.sif', 'docker-daemon://' + MY_IP + '/mattocci/' + k.replace('_', ':')])
    subprocess.call([ 'sudo', 'singularity', 'build', 'singularity/' + k + '.sif', 'docker-daemon://' + MY_IP + '/mattocci/' + k.replace('_', ':')])
