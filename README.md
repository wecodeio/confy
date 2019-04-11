# Confy
**The conference's library**

## Pre-Requisites
- Ruby (version located on [Gemfile](./Gemfile))
- Docker (follow the [Docker Guide](https://docs.docker.com/install/) for your OS)
- Docker Compose (find how to install it in the [Docker Compose Guide](https://docs.docker.com/compose/install/))

## Set Up App and Database

Run the following commands

```
docker-compose build

docker-compose run web yarn install

docker-compose run web rake db:create

docker-compose run web rake db:migrate

docker-compose run web rake db:seed
```

## Run the application

```
docker-compose up
```

## Troubleshoot

### `docker-compose` issues
If you have problems running the `docker-compose` commands you may want to try running them with `sudo` in order to fix the problem.

### Ruby version mismatch when running `docker-compose build`
If you encounter an issue regarding Ruby versions, make sure you have the Ruby version indicated in the [Gemfile](./Gemfile) and [DockerFile](./Dockerfile) (both should be equal) and if you still have issues you can try running `gem update bundler`

