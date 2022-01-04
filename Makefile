INSTALL_FILE := /opt/.inception

DB_NAME := db
WP_NAME := wordpress
SERV_NAME := nginx

VOLUMES_PATH := /home/guhernan/data
VOLUMES := $(VOLUMES_PATH)/$(DB_NAME)_volume $(VOLUMES_PATH)/$(WP_NAME)_volume

DOCKER_EXEC := docker exec
DEXC_FLAGS := -ti

DOCKER_LOGS := docker logs
DLOG_FLAGS := --details

COMPOSE_CC := docker-compose
COMPOSE_PATH := $(abspath srcs/docker-compose.yml)
COMPOSE_FLAGS := -f $(COMPOSE_PATH)
COMPOSE_CMD_BUILD := up --build
COMPOSE_CMD_KILL := down


FLOGS_COMPOSE := inception.logs
FLOGS_SERV := $(addsuffix .logs, $(SERV_NAME))
FLOGS_DB := $(addsuffix .logs, $(DB_NAME))
FLOGS_WP := $(addsuffix .logs, $(WP_NAME))

#########################################################################

all: $(INSTALL_FILE) build

$(INSTALL_FILE):
	touch $(INSTALL_FILE)

build: | $(VOLUMES)
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_BUILD) -d

attach:
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_BUILD)

$(VOLUMES):
	mkdir -p $(VOLUMES)

#########################################################################

exec_db:
	$(DOCKER_EXEC) $(DEXC_FLAGS) $(DB_NAME) /bin/bash

exec_wp:
	$(DOCKER_EXEC) $(DEXC_FLAGS) $(WP_NAME) /bin/sh

exec_nginx:
	$(DOCKER_EXEC) $(DEXC_FLAGS) $(SERV_NAME) /bin/bash

logs:
	$(COMPOSE_CC) $(COMPOSE_FLAGS) logs > $(FLOGS_COMPOSE)
	$(DOCKER_LOGS) $(DLOG_FLAGS) $(DB_NAME) > $(FLOGS_DB)
	$(DOCKER_LOGS) $(DLOG_FLAGS) $(WP_NAME) > $(FLOGS_WP)
	$(DOCKER_LOGS) $(DLOG_FLAGS) $(SERV_NAME) > $(FLOGS_SERV)

#########################################################################

clean:
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_KILL)

fclean:
	$(RM) $(INSTALL_FILE) $(FLOGS_COMPOSE) $(FLOGS_SERV) $(FLOGS_DB) $(FLOGS_WP)
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_KILL) --rmi all -v
	$(RM) -R /home/guhernan/data/*_volume/*

prune:  fclean
	docker system prune --force --all --volumes
	$(RM) -R $(VOLUMES)
	
re:	fclean build

#########################################################################

.PHONY: build attach logs clean fclean re 
