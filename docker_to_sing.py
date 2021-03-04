import yaml, os, subprocess, sys

args = sys.argv
sdir = "."
files = os.listdir(path=sdir)

d = open('docker-compose.yml')
d2 = yaml.safe_load(d)

for k in d2['services'].keys():
    if 'ppca' not in k:
        if args[1] == 'build_from_def':
            subprocess.call([ 'echo', 'singularity', 'build', '' + k + '.sif', 'images/' + k + '/Singularity.def'])
            subprocess.call([ 'sudo', 'singularity', 'build', '' + k + '.sif', 'images/' + k + '/Singularity.def'])
        if args[1] == 'build_from_docker':
            subprocess.call([ 'echo', 'singularity', 'build', ' ' + k + '.sif', 'docker-daemon://' + args[2] + '/mattocci/' + k.replace('_', ':')])
            subprocess.call([ 'sudo', 'singularity', 'build', ' ' + k + '.sif', 'docker-daemon://' + args[2] + '/mattocci/' + k.replace('_', ':')])
        if args[1] == 'push':
            subprocess.call([ 'echo', 'singularity', 'push', '-U', '' + k + '.sif', 'library://mattocci27/default/' + k.replace('_', ':') ])
            subprocess.call([ 'singularity', 'push', '-U', '' + k + '.sif', 'library://mattocci27/default/' + k.replace('_', ':') ])
