import yaml
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed
from collections import defaultdict

dependencies = {
    'radian-verse_4.3.1': 'radian_4.3.1'
}

def build_docker_image(service_name, service_info, build_info):
    context = build_info['context']
    dockerfile = build_info['dockerfile']
    image = service_info['image']

    cmd = f'docker build -t {image} -f {dockerfile} {context}'
    print(f'Building {image}...')

    process = subprocess.run(cmd.split(), capture_output=True, text=True)

    if process.returncode == 0:
        return f'Successfully built {image}'
    else:
        return f'Failed to build {image}\n{process.stderr}'

def build_images_in_order(services):
    # Perform topological sort on the dependency graph
    graph = defaultdict(list)
    visited = set()
    build_order = []

    for dependent, dependency in dependencies.items():
        graph[dependency].append(dependent)

    def visit(service_name):
        if service_name not in visited:
            visited.add(service_name)
            for dependent in graph[service_name]:
                visit(dependent)
            build_order.append(service_name)

    for service_name in services:
        if service_name not in visited:
            visit(service_name)

    # Build images in the correct order
    futures = []
    with ThreadPoolExecutor() as executor:
        for service_name in build_order:
            service_info = services[service_name]
            future = executor.submit(build_docker_image, service_name, service_info, service_info['build'])
            futures.append(future)

        for future in as_completed(futures):
            print(future.result())

def main():
    with open('docker-compose.yml', 'r') as file:
        compose_data = yaml.safe_load(file)

    services = compose_data['services']
    build_images_in_order(services)

if __name__ == '__main__':
    main()
