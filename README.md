# inception-42
A repository to store my data for Inception project. This is a DevOps project.

<p align="center">
	<a href="https://github.com/JaeSeoKim/badge42"><img src="https://badge42.vercel.app/api/v2/cl5r44mjx000609l8jonhbord/project/2452406" alt="guhernan's 42 Inception Score" /></a>
</p>

<p align="center">
	<img src="https://img.shields.io/github/languages/top/Spidfail/inception-42" alt="Most used language"/>
	<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/Spidfail/inception-42">
	<img alt="Repo size" src="https://img.shields.io/github/repo-size/Spidfail/inception-42 ">
	<img src="https://img.shields.io/github/license/Spidfail/inception-42" alt="Licence"/>
</p>

<p align="center">
	<img src="https://img.shields.io/github/last-commit/Spidfail/inception-42" alt="Last commit"/>
	<img src="https://img.shields.io/github/issues-pr/Spidfail/inception-42" alt="Pull requests"/>
	<img src="https://img.shields.io/github/issues/Spidfail/inception-42" alt="Issues"/>
	<img src="https://img.shields.io/github/contributors/Spidfail/inception-42" alt="Contributors"/>
</p>

<p align="center">
	<img src="https://img.shields.io/github/followers/Spidfail?style=social" alt="User followers"/>
	<!-- <img src="https://img.shields.io/github/stars/Spidfail?style=social" alt="User followers"/> -->
	<!-- <img src="https://img.shields.io/github/watchers/Spidfail/inception-42?style=social" alt="User followers"/> -->
</p>

## Original purpose

Inception is the first project oriented DevOps. The goal is simple : build a Wordpress website using `docker-compose`, homemade Dockerfiles with required technologies.

> _The project requires a configured Virtual Machine that will be the testing environment. I choosed Debian latest version but no image is available in this repository as this project can be deploy on any machine with (at least) the 3rd version of Docker._

## How to build and use the project

You should use the Makefile provided :

`make [build]` : to build in **detached mode**.   
`make [attach]` : to build in **attached mode**.  

`make exec_db` : get inside the **Mariadb** (database) container with `bash`.   
`make exec_wp` : get inside the **Wordpress** container with `sh`.
`make exec_nginx` : get inside the **Nginx** container with `bash`.

`make logs` : get the container's logs on output files.

`make clean` : equivalent to `docker-compose -f down`.   
`make fclean` : run a `clean` then remove additional data (logs, docker images/volumes, local volumes directories).   
`make prune` : a `docker system prune` that will clean your local Docker. **WARNING** : do not do this if you care about your docker containers, docker images and volumes.   

`make re` : `fclean` then `build` the project.

## Constraints

We must use :
 - **Homemade Images** based on *Debian Buster* or *Alpine*. In other terms each container is configured manually. For exemple, getting the official Mariadb image from the Docker Hub is forbidden.
 - **Persistent data**, Wordpress shouldn't be reinstall at each run, all commentary or manual configurations must be kept between launches.

### Technologies guidelines

- **Nginx** as a _reverse proxy_
- **Mariadb** as a _running database_
- **Wordpress + Php-fpm** as a _running website_
- **SSL encryption** is requiered. Self signed certificates are used as it is a school project. It's implemented in the Nginx configuration file.

### Docker guidelines

- **Docker-compose**
- **Docker Network**, isolated from the host network. Here it's a simple `bridge`.
- **Volumes** with a specific path on the machine. A volume must be shared between the database and the website.

