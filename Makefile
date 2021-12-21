INSTALL_FILE: /opt/.inception

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
	export DB_NAME=$(DB_NAME)
	export WP_NAME=$(WP_NAME)
	export SERV_NAME=$(SERV_NAME)
	export VOLUMES_PATH=$(VOLUMES_PATH)

build: | $(VOLUMES)
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_BUILD) -d

attach:
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_BUILD)

$(VOLUMES):
	mkdir -p $(VOLUMES)

#########################################################################

exec_db:
	$(DOCKER_EXEC) $(DEXC_FLAGS) $(DB_NAME) /bin/bash >> $(FLOGS_DB)
	echo "" >> $(FLOGS_DB)

exec_wp:
	$(DOCKER_EXEC) $(DEXC_FLAGS) $(WP_NAME) /bin/sh >> $(FLOGS_WP)
	echo "" >> $(FLOGS_WP)

exec_nginx:
	$(DOCKER_EXEC) $(DEXC_FLAGS) $(SERV_NAME) /bin/bash >> $(FLOGS_SERV)
	echo "" >> $(FLOGS_SERV)

logs:
	$(COMPOSE_CC) $(COMPOSE_FLAGS) logs >> $(FLOGS_COMPOSE)
	$(DOCKER_LOGS) $(DLOG_FLAGS) $(DB_NAME) > $(FLOGS_DB)
	$(DOCKER_LOGS) $(DLOG_FLAGS) $(WP_NAME) > $(FLOGS_WP)
	$(DOCKER_LOGS) $(DLOG_FLAGS) $(SERV_NAME) > $(FLOGS_SERV)
	echo "" >> $(FLOGS_COMPOSE)
	
#########################################################################

clean:
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_KILL)

fclean:
	$(COMPOSE_CC) $(COMPOSE_FLAGS) $(COMPOSE_CMD_KILL) --rmi all -v
	$(RM) -R /home/guhernan/data/*_volume/*

prune: 
	docker system prune --force --all --volumes
	$(RM) -R $(VOLUMES)
	$(RM) $(INSTALL_FILE) $(FLOGS_COMPOSE) $(FLOGS_SERV) $(FLOGS_DB) $(FLOGS_WP)
	
re:	fclean build

#########################################################################

.PHONY: build attach logs clean fclean re 
