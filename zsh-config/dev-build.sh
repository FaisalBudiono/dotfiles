docker compose down
docker compose -f docker-compose.yml -f docker-compose-build.yml up -d --build
./dev-exec.sh
