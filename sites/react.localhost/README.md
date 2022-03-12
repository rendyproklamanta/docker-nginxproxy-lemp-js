# Run docker-compose (Development)

## Requirement Development:

- Download and install [GitBash](https://git-scm.com) to run shell script

<br>

## Run via Shell Script (Recommended)

1. Open new terminal in VsCode [**Ctrl + `**] and set to **Git Bash**
2. Run script :

```
cd deploy
./local.sh
```

<br>

## Run through CLI

1. First drop all images < none >

```
docker image prune --filter="dangling=true"
```

2. And run docker-compose

```
docker-compose -f docker-compose.local.yml up --build --force-recreate -d
```

<br>

## Open app in development mode.

Goto url [http://localhost:3001](http://localhost:3001) to view it in the browser.

The page will auto reload if you make edit in js file. (Support Live Reloading)<br />
You will also see any logs / errors in the Docker Desktop console.

<br>

# Run docker-compose (Production)

https://gist.github.com/rendyproklamanta/e9c1942862b904634329156d55da3b42

<br>

# Auto deploy to server

## Edit production.sh

1. Open file in **deploy/production.sh**

2. Edit _service_name_ value with this Tutorial :

- Open **docker-compose.production.yml** , change _sample_service_ with your own and copy _sample_service_ to replace in service_name in production.sh

- Comment container_name and dont use it!

```
services:
  sample_service: # this is service_name to copy in production.sh
    image: react/frontend
    # container_name: DONT USE container name!
```

<br>

## Edit production.env

Open file in **env/production.env**

```
DOMAIN=change_with_your_domain
```

<br>

## Edit gitlab-ci.yml

https://gist.github.com/rendyproklamanta/ca50656d4474125258d811f8d7c4f4e6

<br>

## Login to server

1. Clone this repository :

2. Create nginx-proxy network

```
docker network create nginx-proxy
```

3. Run compose nginx

```
docker-compose -f docker-compose.nginx.yml up --build --force-recreate -d
```

4. Clone your repository

5. Test push from gitlab/github, and check your docker update automaticaly

```
docker ps
```


<br>
<hr>
<br>

NOTE :

- delete all container, images, volumes (clear all):

```
docker system prune -a
```

- delete all volumes :

```
docker system prune --volumes
```
