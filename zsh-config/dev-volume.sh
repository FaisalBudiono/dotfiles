docker compose down
docker compose -f docker-compose.yml -f docker-compose-volume.yml up -d --build
./dev-exec.sh
