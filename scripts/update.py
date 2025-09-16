import json
import os
from jinja2 import Environment, FileSystemLoader


def render_template(env, template_name, context, output_path):
    template = env.get_template(template_name)
    template.stream(context).dump(output_path)


def select_arch_value(val, arch):
    if isinstance(val, dict):
        # Pick arch-specific override when available
        return val.get(arch, val.get('default'))
    return val


def main():
    with open('images.json') as f:
        cfg = json.load(f)

    owner = cfg['owner']
    version = cfg['version']
    arches = cfg.get('arches', ['amd64', 'arm64'])
    images = cfg['images']

    env = Environment(loader=FileSystemLoader('./templates'), trim_blocks=True, lstrip_blocks=True)

    for image in images:
        name = image['name']
        base_image_tpl = image['baseImage']
        for arch in arches:
            # Build per-arch context
            context = {
                'owner': owner,
                'imageName': name,
                'imageVer': f"{version}_{arch}",
                'imageTag': f"{name}_{version}_{arch}",
            }

            # Render base image string with placeholders
            context['baseImage'] = base_image_tpl.format(version=version, arch=arch)

            # Merge global optional arrays if present
            for key in ['installGithub', 'label']:
                global_vals = cfg.get(key, [])
                local_vals = image.get(key, [])
                if global_vals or local_vals:
                    context[key] = list(global_vals) + list(local_vals)

            # Copy passthrough keys, applying arch selection when value is a dict
            passthrough_keys = [
                'systemPackages', 'installCRAN', 'installGithub',
                'tinytex', 'quarto', 'quartoVer', 'updateLatex',
                'ai', 'zsh', 'cmdstan', 'cmdstanVer', 'bio', 'Rcpp',
                'radian', 'vscodeRenv', 'gpu', 'font', 'crossrefVer', 'pandocVer'
            ]
            for key in passthrough_keys:
                if key in image:
                    context[key] = select_arch_value(image[key], arch)

            # Ensure booleans are present as-is (template checks truthiness)
            # Create output directory and render
            dockerfile_dir = f"images/{context['imageTag']}"
            os.makedirs(dockerfile_dir, exist_ok=True)

            note = 'NOTE: THIS DOCKERFILE IS GENERATED VIA "update.py"'
            render_template(env, 'Dockerfile.jinja', {**context, 'note': note}, f"{dockerfile_dir}/Dockerfile")
            render_template(env, 'Makefile.jinja', context, f"{dockerfile_dir}/Makefile")


if __name__ == '__main__':
    main()
