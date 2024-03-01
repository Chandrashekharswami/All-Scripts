import docker

# Connect to Docker daemon
client = docker.from_env()

def update_image(image_name):
    try:
        # Pull the latest image
        image = client.images.pull(image_name)

        # Tag the pulled image as 'latest'
        client.images.tag(image=image.id, repository=image_name, tag='latest')

        print(f"Successfully updated {image_name} to the latest version.")
    except docker.errors.APIError as e:
        print(f"Error updating {image_name}: {e}")

def cleanup_images():
    try:
        # Clean up unused images
        pruned_summary = client.images.prune()
        if pruned_summary.get('ImagesDeleted') is not None:
            print(f"Successfully cleaned up {pruned_summary['ImagesDeleted']} unused images.")
        else:
            print("No unused images to clean up.")
    except docker.errors.APIError as e:
        print(f"Error cleaning up images: {e}")

def main():
    # List of Docker images to maintain
    images_to_maintain = [
        "your_image_name_1",
        "your_image_name_2",
        # Add more image names as needed
    ]

    # Update each image
    for image_name in images_to_maintain:
        update_image(image_name)

    # Clean up unused images
    cleanup_images()

if __name__ == "__main__":
    main()
