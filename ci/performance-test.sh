#! /bin/bash
[[ -z "${docker_username}" ]] && DockerRepo='' || DockerRepo="${docker_username}/"
echo "$docker_password" | docker login ghcr.io --username "$docker_username" --password-stdin
docker_username=$DockerRepo docker compose -f performance-test/docker-compose.yml --project-directory . -p ci up --build --exit-code-from test