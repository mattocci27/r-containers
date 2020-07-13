import yaml
import os
import subprocess
MY_IP='192.168.1.123:5000'
sdir = "."
outdir = "."
files = os.listdir(path=sdir)

d = open('docker-compose.yml')
d2 = yaml.safe_load(d)
#print(d2)
for k in d2['services'].keys():
    subprocess.call([ 'echo', 'singularity', 'build', 'singularity/' + k + '.sif', 'docker-daemon://' + MY_IP + '/mattocci/' + k.replace('-', ':')])
    subprocess.call([ 'sudo', 'singularity', 'build', 'singularity/' + k + '.sif', 'docker-daemon://' + MY_IP + '/mattocci/' + k.replace('-', ':')])