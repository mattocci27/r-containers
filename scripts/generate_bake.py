import json
from jinja2 import Environment, FileSystemLoader

def main():
    # Load the images.json data
    with open('images.json') as f:
        images_data = json.load(f)

    # Set up the Jinja environment
    env = Environment(loader=FileSystemLoader('.'), trim_blocks=True, lstrip_blocks=True)

    # Load the template
    template = env.get_template('templates/bakefile_template.jinja')

    # Render the template with the images data
    rendered_bakefile = template.render(images=images_data)

    # Write the rendered bakefile to bakefile.json
    with open('bakefiles/bakefile.json', 'w') as f:
        f.write(rendered_bakefile)

    print('Generated bakefiles/bakefile.json')

if __name__ == '__main__':
    main()
