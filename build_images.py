import yaml
import subprocess
from concurrent.futures import ThreadPoolExecutor

def build_docker_image(service, build_info):
    context = build_info['context']
    dockerfile = build_info['dockerfile']
    image = service['image']

    cmd = f'docker build -t {image} -f {dockerfile} {context}'
    print(f'Building {image}...')

    process = subprocess.run(cmd.split(), capture_output=True, text=True)

    if process.returncode == 0:
        print(f'Successfully built {image}')
    else:
        print(f'Failed to build {image}')
        print(process.stderr)

def main():
    with open('docker-compose.yml', 'r') as file:
        compose_data = yaml.safe_load(file)

    services = compose_data['services']

    with ThreadPoolExecutor() as executor:
        futures = [
            executor.submit(build_docker_image, service_info, service_info['build'])
            for service_name, service_info in services.items()
        ]

if __name__ == '__main__':
    main()
