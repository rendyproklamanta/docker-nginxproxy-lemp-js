# CRUD-NodeJS-Sequelize-Swagger-MySQL-Dockerize

Simple CRUD example with NodeJS, Sequelize, Swagger and MySQL

## Technologies:

- NodeJS Express v4.16.4
- Sequelize v4.38.0
- Swagger UI v3.20.1
- MySQL

## Requirement Development:

- [GitBash](https://git-scm.com) to run shell script

## Objective

The objective of this guide is to make a [NodeJS Express](https://expressjs.com/pt-br/) web API connecting with a [MySQL](https://dev.mysql.com/downloads/installer/) database by using the [Sequelize ORM](https://sequelize.org/) (Object-relational mapping). The [Swagger UI](https://swagger.io/tools/swagger-ui/) will be used to test the API.

## Import DB

- Run the script located at "/docs/crud.sql" to create the database on MySQL Workbench or on another program of your preference.

<br>

# To run this project in docker (Development only)

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
- First drop all images < none >
```
    docker image prune --filter="dangling=true"
```

- Without Daemon (show logs in VScode terminal):
```
    docker-compose -f docker-compose.local.yml up --build --force-recreate
```

- With Daemon (show logs in docker desktop):
```
    docker-compose -f docker-compose.local.yml up --build --force-recreate -d
```

- Acess the URL:

```
    http://localhost:3000
```

![Alt Text](/docs/swagger.JPG)

<br>


# Nginx-Proxy and SSL

## Run docker-compose (Production)

https://gist.github.com/rendyproklamanta/e9c1942862b904634329156d55da3b42

<br>

## Auto deploy to server using (gitlab-ci.yml)

https://gist.github.com/rendyproklamanta/ca50656d4474125258d811f8d7c4f4e6

<br><br>

# How it works

The structure of the project is this:

![Alt Text](/docs/node01.JPG)

The "server.js" file creates a MySQL pool to allow multiple connections:

![Alt Text](/docs/node02.JPG)

The "/config/config.json" contains database connections for different environments. They are used by the "/models/index.js" file during the Sequelize initialization:

![Alt Text](/docs/node03.JPG)

The "/models" folder contains the Sequelize table models. For example: the "profiles" model.

![Alt Text](/docs/node04.JPG)

The "users" model makes reference to the "profiles" model:

![Alt Text](/docs/node05.JPG)

The "/plugins/transaction.js" file is responsible for making the transaction's commit and rollback:

![Alt Text](/docs/node06.JPG)

The "/controllers/users.js" has the GET/POST/PUT/DELETE methods:

![Alt Text](/docs/node07.JPG)
