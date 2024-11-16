# Human Kind Code Project

## Docker

Build docker image:

```bash
docker build -t <image_name> .
```

- `docker build`: Build image from Dockerfile
- `-t <image_name>`: Assign a tag to the image

Run docker container:

```bash
docker run -d -p 3000:3000 <image_name>

```

- `docker run`: Start a container from image
- `-d`: Run container in background
- `-p 3000:3000`: Map port 3000 of host to port 3000 of container
- `<image_name>`: Name of the image

You can access the app at `http://localhost:3000` now.

## Docker Compose

Build and run docker container using docker-compose:

```bash
docker-compose up -d
```

- `docker-compose up`: Build and run container from docker-compose.yml
- `-d`: Run container in background
