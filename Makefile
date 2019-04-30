GIT_TAG     := $$(git log -1 --pretty=%H)
BRANCH_NAME := $$(git rev-parse --abbrev-ref HEAD)

NAMESPACE   := chimney_rock
IMG_NAME    := company_service
TAG_CURRENT := ${NAMESPACE}/${IMG_NAME}:${GIT_TAG}-${BRANCH_NAME}
TAG_LATEST  := ${NAMESPACE}/${IMG_NAME}:latest


# Load the environment file
env_file ?= .env
include $(env_file)
export $(shell sed 's/=.*//' $(env_file))

.PHONY: help
.DEFAULT_GOAL := help

help: ## Shows this information.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build-development: ## Builds the container for development.
	@docker build --build-arg BUNDLE_WITHOUT="production" -t ${IMG_NAME} .

build: ## Builds the container for production.
	@docker build -t ${IMG_NAME} .

build-nc: ## Build the container without caching for production.
	@docker build --no-cache -t ${IMG_NAME} .

publish: publish-current ## Publishes both tags to the Docker Hub.

publish-latest: tag-latest docker-login ## Publishes the `:latest` container tag to Docker Hub.
  docker push ${TAG_LATEST}

publish-current: tag-current docker-login ## Publishes the container tag with the git commit hash to Docker Hub.
	docker push ${TAG_CURRENT}

tag: tag-latest tag-current ## Generates container tags for `:latest` and the git commit hash.

tag-latest: ## Tags the current image with the `:latest` tag.
	@docker tag ${IMG_NAME} ${TAG_LATEST}

tag-current: ## Tags the current image with the git commit hash.
	@docker tag ${IMG_NAME} ${TAG_CURRENT}

docker-login:
	docker login --username "${DOCKER_USER}" --password "${DOCKER_PASS}"
