import json
from jinja2 import Environment, FileSystemLoader


def expand_configs(data):
    owner = data['owner']
    version = data['version']
    arches = data.get('arches', ['amd64', 'arm64'])
    configs = []
    for image in data['images']:
        name = image['name']
        for arch in arches:
            configs.append({
                'imageName': name,
                'imageTag': f"{name}_{version}_{arch}",
                'imageVer': f"{version}_{arch}",
                'arch': arch,
            })
    return owner, configs


def main():
    with open('images.json') as f:
        data = json.load(f)

    owner, configs = expand_configs(data)

    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)
    template = env.get_template('templates/bakefile_template.jinja')

    outputs = [
        ("amd", "amd64", "bakefiles/bakefile_amd.json"),
        ("arm", "arm64", "bakefiles/bakefile_arm.json"),
    ]

    for arch_short, arch_platform, outfile in outputs:
        rendered = template.render(owner=owner, configs=configs, arch_short=arch_short, arch_platform=arch_platform)
        with open(outfile, 'w') as f:
            f.write(rendered)
        print(f'Generated {outfile}')


if __name__ == '__main__':
    main()
