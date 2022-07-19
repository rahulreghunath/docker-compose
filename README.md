# docker-compose
Multi container docker composer configurations for different development stacks  

## PHP

* #### PHP
  PHP configurations can be found in ```docker/php``` folder.  
* #### Composer
  Composer depandencies can be installed using the command 
  ```docker-compose run --rm composer your-command```
* #### Nginx
   Nginx configurations can be found in ```docker/nginx``` folder.
   Default document root will be ```public``` directory. This can be changed in ```default.conf```
* ### Artisan
  If using with laravel application, artisan commands can be easily run as ```docker-composer run --rm artisan your-command```

## PYTHON