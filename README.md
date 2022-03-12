# 1. Create docker network

```
docker network create nginx-proxy
```

# 2. Run php-fpm with nginx

```
docker-compose -f docker-compose.nginx-php.yml up --build -d
```

# 3. Run mysql + phpmyadmin + redis

```
docker-compose -f docker-compose.database.yml up --build -d
```

- MySQL (3306) : mysql -u root -p root -h host -P 3306 
- PhpMyAdmin (8000) : http://localhost:8000
- Redis (6379) : http://localhost:6379

<br>

```
MySql & PhpMyAdmin Credential
user : root
password : root

You can change password root in docker-compose.database.yml
MYSQL_ROOT_PASSWORD
```

# 4. Run web in directory

```
cd /sites/domain.com
docker-compose -f docker-compose.production.yml up --build --force-recreate --no-deps -d
```
