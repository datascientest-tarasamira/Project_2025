## Build the images:

```bash
cd project-root/
```

```bash
docker compose build --no-cache
```

## Build and run the containers:

```bash
docker compose up -d
```
## WordPress URL:

```
http://127.0.0.1
```

## PHPMyAdmin URL:
```
http://127.0.0.1/8080
```

## Access the running WordPress CLI container:

```bash
docker exec -it project-root-wpcli-1 /bin/bash
```

## Exit the container:

```bash
exit
```

## Clean up all containers:

```bash
docker compose down -v
```

## Delete all images from local host:

```bash
docker rmi $(docker images -q)
```