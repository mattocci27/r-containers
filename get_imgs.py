import yaml
import os
import subprocess
MY_IP='192.168.1.123:5000'
sdir = "./compose"
outdir = "."
files = os.listdir(path=sdir)

for file in files:
    file2 = os.path.join(sdir, file)                                               
    d = open(file2, 'r')                                                           
    d2 = yaml.safe_load(d)                                                              
    for k in d2['services'].keys():
        subprocess.call([ 'echo', 'singularity', 'build', 'singularityfiles/' + k + '.sif', 'docker-daemon://' + MY_IP + '/mattocci/' + k.replace('-', ':')])
        subprocess.call([ 'sudo', 'singularity', 'build', 'singularityfiles/' + k + '.sif', 'docker-daemon://' + MY_IP + '/mattocci/' + k.replace('-', ':')])

