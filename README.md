# Alpine Docker image for Laravel applications
This is a docker image based on the PHP7 FPM alpine image that is able to serve Laravel applications.

## Configuration
- [php:7-fpm-alpine](https://hub.docker.com/_/php/) base image
- PHP7
  - FPM
  - mysqli
  - mbstring
  - pdo
  - mcrypt
  - memcached
  - pdo
  - tokenizer
  - xml
- nginx
- supervisor

## Running the docker image
To run the docker image simply run the following command (change volumes and ports to fit your environment)
```
docker run -d -p 8080:80 -v /path/to/local/laravel:/var/www/html nielsvdoorn/docker-alpine-laravel:latest
```
After this your Laravel application should be available at http://localhost:8080

## Customization
This sections explains how to customize this docker image to fit your needs. There are a few ways to customize this docker image. This can be done through changing the Dockerfile in this repository and rebuilding the image or extending from the image itself. In all examples below I will be extending the image.

### Install other PHP extensions
To install additional PHP extensions run the docker-php-ext-install command. You may need to install dependencies before installing the extension based on the extension that will be installed.
```
FROM nielsvdoorn/docker-alpine-laravel:latest
RUN docker-php-ext-install simplexml
```

### Changing the nginx configuration
To change the nginx configuration edit the nginx.conf to your needs, after that edit your Dockerfile to replace the default configuration
```
FROM nielsvdoorn/docker-alpine-laravel:latest
COPY nginx.conf /etc/nginx/nginx.conf
```

### Changing the supervisor configuration
To change the supervisor configuration edit the supervisord.conf file to your needs, after that edit your Dockerfile to replace the default configuration
```
FROM nielsvdoorn/docker-alpine-laravel:latest
COPY supervisord.conf /etc/supervisord.conf
```

## Roadmap
- Write a blog post on deploying this image to various cloud providers
- Slim down the image

## Troubleshooting / Issues / Contributing
Feel free to open an issue in this repository or contact me on [Twitter](https://twitter.com/Niels277). Contributions are also more than welcome.
