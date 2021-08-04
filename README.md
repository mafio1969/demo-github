**Tested on ubuntu 20.04 INFO Distributor ID: Debian  
Description: Debian GNU/Linux 10 (buster)  
PHP: PHP 8.0.8 (cli)   
NGINX:  nginx/1.14.2 **    
  
**For the application to work, it is necessary to run dockerfile or docker-compose**    
**To run on the system, docker and docker-compose must be installed**    
  
# Note: All commands are executed in the directory where docker-compose.yml is located  
## Linux  
1.[install docker ubuntu](https://docs.docker.com/compose/install)  
2.[install docker-compose ubuntu](https://docs.docker.com/compose/install)  
## WIN  
1.[install docker win 10](https://docs.docker.com/docker-for-windows/install/)

**NOTE `<EXAMPLE>` To be replaced with the appropriate values**  
       **`exit 0` or `exit status 0` In linux it means `[OK]` any other number is an error**
##  RUN APPLICATION USING scripts-sh  
### ROAD MAP:  
1.run in terminal `first-run-make-env.sh`   
2.Run `docker ps` get container id
3.Run `docker exec -it <container_id> bash` ('mfdemo')
4.RUN in container `symfony new my_project_name --full` or
                   `symfony new my_project_name` or
                   `composer create-project symfony/website-skeleton my_project_name` or
                   `composer create-project symfony/skeleton my_project_name` 

## Commands:
- `docker network create mf-net` (zero command)
- `docker-compose build` (first command)  
- `docker-compose up` (second command to start docker and after building the container)  
- `docker ps` (list of current containers)  
- `docker down -v` (stop and remove v-optional)  
- `docker exec -it <container_id> bash` (wejście do kontenera)
       Note: All commands are executed in the directory where docker-compose.yml is located
  
Note: in case of port conflicts, database name ... it is possible to change the value in the _**.env** _ file in the _**
     .env_example**_ file, we do not change anything in the main application directory.
### Links according to the .env_example file:
NOTE: RUN `docker ps` The list will include the port, e.g. 8070:8080 the first is the host port, e.g. http://localhost:8070   
      used in the browser should display a running application  
      app: http://localhost:<WEB_PORT>  
      database: localhost:<DATABASE_PORT> user: <DATABASE_USER>(test)   
      password:<DATABASE_PASSWORD>(1234) database:<DATABASE_NAME> (ccfound)    
      app login:  `michal.kurosz@gmail.com` password `AHArvk!#AG7dFqm[` (for all user)  

[mafio69](mailto:mf1969@gmail.com?subject=[GitHub]%20Docker%20Repo) 