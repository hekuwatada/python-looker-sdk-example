.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -o pipefail -euc

DOCKER_IMAGE_TAG = 'python-looker-sdk-local'
WORKING_DIR = '.'
PYTHON_SCRIPT='get_all_dashboards.py'

# project setup
.PHONY: setup
setup: docker/build
	@echo "\n== setup\n"
	source exports.sh && envsubst < looker.ini.template > looker.ini

# run Python script to connect to Looker via Looker SDK
.PHONY: run
run:
	@echo $@
	$(MAKE) docker/python ARGS=$(PYTHON_SCRIPT)

.PHONY: lint
lint:
	@echo "\n== lint\n"
	black .

##############################
# Docker
##############################
# build Docker image
.PHONY: docker/build
docker/build:
	@echo "\n== docker/build\n"
	docker build . -t $(DOCKER_IMAGE_TAG)

# run Docker image mounting the current directory
.PHONY: docker/run
docker/run:
	@echo "\n== docker/run\n"
	docker run -it --rm \
		--mount src="$$(pwd)",target=/workspaces,type=bind \
		-w /workspaces/$(WORKING_DIR) \
		--entrypoint /bin/bash \
		$(DOCKER_IMAGE_TAG)

# run Python in a Docker container
.PHONY: docker/python
docker/python:
	@echo "\n== docker/python\n"
	docker run --rm \
		--mount src="$$(pwd)",target=/workspaces,type=bind \
		-w /workspaces/$(WORKING_DIR) \
		--entrypoint python \
		$(DOCKER_IMAGE_TAG) \
		$(ARGS)
