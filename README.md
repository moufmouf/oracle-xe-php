# Oracle XE PHP Docker image

This Docker image is tailored at running PHP integration tests against an Oracle database.

It contains:

- Oracle XE 11g
- PHP 7.1 CLI (with OCI8 driver) 

It is built upon [wnameless/oracle-xe-11g](https://hub.docker.com/r/wnameless/oracle-xe-11g/) for the Oracle installation so you can refer to  [wnameless/oracle-xe-11g documentation](https://hub.docker.com/r/wnameless/oracle-xe-11g/) for any Oracle-related settings.

## Usage

Your PHP application should be mounted in the `/app` folder.


For instance, if you want to run the `vendor/bin/phpunit` command in the container, you do:

```
docker run -v $(pwd):/app mouf/oracle-xe-php vendor/bin/phpunit
```

Note: the Oracle database will be reset on each run.

If you want to run a SQL initialization script before running your command, you can mount SQL files in the `/docker-entrypoint-initdb.d/` directory.

```
docker run -v $(pwd):/app --mount type=bind,source=$(pwd)/sql/my-startup-script.sql,destination=/docker-entrypoint-initdb.d/my-startup-script.sql,readonly mouf/oracle-xe-php vendor/bin/phpunit
```
