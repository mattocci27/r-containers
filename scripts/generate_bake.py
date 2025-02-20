import json
from jinja2 import Environment, FileSystemLoader

def main():
    # Load the images.json data
    with open('images.json') as f:
        images_data = json.load(f)

    # Set up the Jinja environment; template files live in the "templates" folder
    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template
    template = env.get_template('templates/bakefile_template.jinja')

    # Define outputs: (architecture, output file)
    outputs = [
        ("amd", "bakefiles/bakefile_amd.json"),
        ("arm", "bakefiles/bakefile_arm.json")
    ]

    # Render the template for each architecture and write the result
    for arch, outfile in outputs:
        rendered_bakefile = template.render(images=images_data, arch=arch)
        with open(outfile, 'w') as f:
            f.write(rendered_bakefile)
        print(f'Generated {outfile}')

if __name__ == '__main__':
    main()
