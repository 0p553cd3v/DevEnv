# Project title
Deockerized Developement Environment
## Introduction - the project's aim
Aim of the project is ...
## Technologies
Project is created with:
* Docker
* Python
* Shell

## Hardware
Following hardware setup is used for the project:
* n/a

## Prerequisities
To run this project following prerequisites have to be fulfilled:
* For linux based OS
- docker
* For Windows OS
- WSL installed
- Ubuntu image installed from Microsoft Store
- Docker Desktop installed

## Launch
To run this project, make following instructions:
* Create folder for code in user folder
```
$ mkdir Git && cd $_
```
* Download git repository 
```
$ git clone https://github.com/0p553cd3v/DevEnv.git
```
* Run preparation script
```
bash $HOME/Git/DevEnv/tools/def_setup.sh
```
* Modify configuration and build files under: 
- $HOME/.config/devenv/docker-compose.yaml
- $HOME/.config/devenv/ubuntu/config.yml
- $HOME/.config/devenv/ubuntu/Dockerfile
* Run deployment script
```
$ bash $HOME/Git/RPI-PiHole/tools/deploy.sh
```
* Syslog server is up and running
## Notes
