import subprocess
import os

def build_and_push_docker_image(image_name, dockerfile_path='.', tag='latest'):
    # Build Docker image
    build_command = f"docker build -t {image_name}:{tag} {dockerfile_path}"
    subprocess.run(build_command, shell=True, check=True)

    # Push Docker image to registry
    push_command = f"docker push {image_name}:{tag}"
    subprocess.run(push_command, shell=True, check=True)

def deploy_with_docker_compose(compose_file='docker-compose.yml', service_name='web_app'):
    # Deploy application using Docker Compose
    deploy_command = f"docker-compose -f {compose_file} up -d --no-deps --build {service_name}"
    subprocess.run(deploy_command, shell=True, check=True)

def main():
    # Set Docker image and application details
    image_name = "your_registry/your_web_app"
    dockerfile_path = "./path/to/your/dockerfile"
    compose_file = "docker-compose.yml"
    service_name = "web_app"

    try:
        # Build and push Docker image
        build_and_push_docker_image(image_name, dockerfile_path)

        # Deploy application using Docker Compose
        deploy_with_docker_compose(compose_file, service_name)

        print("Deployment successful!")
    except subprocess.CalledProcessError as e:
        print(f"Error during deployment: {e}")

if __name__ == "__main__":
    main()