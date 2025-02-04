resource "docker_image" "my_image" {
  name = "my-local-image:latest"

  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "my_container" {
  name  = "my-container"
  image = docker_image.my_image.name

  ports {
    internal = 80
    external = 8080
  }
}