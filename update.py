from jinja2 import Environment, FileSystemLoader
from os import makedirs, path
from datetime import datetime
import json
import ruamel
import ruamel.yaml

yaml = ruamel.yaml.YAML()

with open('images.json') as f:
  config_data = json.load(f)

#now_utc = datetime.utcnow().isoformat()

note = 'NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"'

env = Environment(
  loader=FileSystemLoader('./templates'),
  trim_blocks=True,
  lstrip_blocks=True,
)

imgs = {}
for d in config_data.get('configs', []):
  # extend local image list with global lists (both are optional)
  d['owner'] = config_data.get('owner', [])
  for key in [ 'installGithub', 'label']:
    d[key] = config_data.get(key, []) + d.get(key, [])

  # Dockerfile
  template = env.get_template('Dockerfile.jinja')
  dockerfile_dir = 'images/{}'.format(d.get('imageTag'))
  if not path.isdir(dockerfile_dir):
        makedirs(dockerfile_dir)

  template.stream({
    'note': note,
    **d
  }).dump('{}/Dockerfile'.format(dockerfile_dir))

  # Makefile
  template2 = env.get_template('Makefile.jinja')

  template2.stream({
    **d
  }).dump('{}/Makefile'.format(dockerfile_dir))

  # docker-compose
  d2 =  {d['imageTag'] : {
    'image': d['owner'] + "/" + d['imageName'] + ':' + d['imageVer'],
    'extra_hosts': ['api.github.com:140.82.112.5'],
    'build': {
      'context': '.',
      'dockerfile': 'images/' + d['imageTag'] + '/Dockerfile'
    }
  }}
  imgs.update(d2)

# docker-compose
d3 =  {'version': '3', 'services':imgs}
with open("docker-compose.yml", "w") as wf:
  yaml.dump(d3, wf)
