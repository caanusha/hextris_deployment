IMAGE_NAME = hextris
IMAGE_TAG = latest
CLUSTER_NAME = hextris-cluster
HELM_CHART_DIR = ./helm/hextris

.PHONY: build load deploy clean

all: build load deploy

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

load:
	kind load docker-image $(IMAGE_NAME):$(IMAGE_TAG) --name $(CLUSTER_NAME)

deploy:
	helm upgrade --install $(IMAGE_NAME) $(HELM_CHART_DIR) \
		--set image.repository=$(IMAGE_NAME),image.tag=$(IMAGE_TAG)

clean:
	helm uninstall $(IMAGE_NAME) || true
	kubectl delete pods -l app=$(IMAGE_NAME) || true
