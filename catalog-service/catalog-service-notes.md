docker run -d --net catalog-network --name polar-postgres -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -e
POSTGRES_DB=polardb_catalog -p 5432:5432 postgres:14.4
docker run -d --net catalog-network --name catalog-service -e SPRING_PROFILES_ACTIVE=testdata -e
SPRING_DATASOURCE_URL=jdbc:postgresql://polar-postgres:5432/polardb_catalog -p 9001:9001 catalog-service

### Build multiarch image and push it to github registry

docker buildx create --use --name buildx_instance
docker buildx build --platform linux/amd64,linux/arm/v8 -t ghcr.io/vladstus/catalog-service:latest . --push