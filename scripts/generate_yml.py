import json
from jinja2 import Environment, FileSystemLoader

def generate_yaml(platform):
    # Load the JSON data
    with open('images.json') as f:
        data = json.load(f)

    # Set up the Jinja environment
    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template
    template = env.get_template('templates/update_template.yml.jinja')

    # Render the template with the data and the specified platform
    rendered_yml = template.render(data=data, platform=platform)

    # Write the rendered YAML to a file
    output_filename = f'.github/workflows/update_{platform}.yml'
    with open(output_filename, 'w') as f:
        f.write(rendered_yml)

    print(f'Generated {output_filename}')

# Generate YAML files for each platform
generate_yaml('amd64')
# generate_yaml('arm64')
