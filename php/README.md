## Running this PHP-FPM Docker first before running other container

<br>

```
docker-compose up --build -d --force-recreate
```

And use image name **php/fpm74** in php container
```
services:
  php_service_name:
    image: php/fpm74
```