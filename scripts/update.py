import json
import os
from jinja2 import Environment, FileSystemLoader
import ruamel.yaml

def render_template(env, template_name, context, output_path):
    template = env.get_template(template_name)
    template.stream(context).dump(output_path)

def main():
    yaml = ruamel.yaml.YAML()

    with open('images.json') as f:
        config_data = json.load(f)

    env = Environment(loader=FileSystemLoader('./templates'), trim_blocks=True, lstrip_blocks=True)

    imgs = {}
    for config in config_data.get('configs', []):
        config['owner'] = config_data.get('owner', [])
        for key in ['installGithub', 'label']:
            config[key] = config_data.get(key, []) + config.get(key, [])

        dockerfile_dir = f"images/{config.get('imageTag')}"
        os.makedirs(dockerfile_dir, exist_ok=True)

        note = 'NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"'
        render_template(env, 'Dockerfile.jinja', {'note': note, **config}, f"{dockerfile_dir}/Dockerfile")
        render_template(env, 'Makefile.jinja', config, f"{dockerfile_dir}/Makefile")

        imgs[config['imageTag']] = {
            'image': f"{config['owner']}/{config['imageName']}:{config['imageVer']}",
            'build': {
                'context': '.',
                'dockerfile': f"images/{config['imageTag']}/Dockerfile"
            }
        }

    docker_compose_config = {'version': '3', 'services': imgs}
    with open("docker-compose.yml", "w") as wf:
        yaml.dump(docker_compose_config, wf)

if __name__ == '__main__':
    main()
