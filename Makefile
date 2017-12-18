TAG=apprenda/cni-bin
VERSION=v0.6.0
CNI_VERSION=v0.6.0

build: get/cni
	docker build -t $(TAG) .
	docker tag $(TAG) $(TAG):$(VERSION)

get/cni:
	rm -rf dist
	mkdir -p dist
	curl -L --retry 5 https://github.com/containernetworking/cni/releases/download/$(CNI_VERSION)/cni-amd64-$(CNI_VERSION).tgz | tar -xz -C dist
	curl -L --retry 5 https://github.com/containernetworking/plugins/releases/download/$(CNI_VERSION)/cni-plugins-amd64-$(CNI_VERSION).tgz | tar -xz -C dist

dist: build
	docker push $(TAG):latest
	docker push $(TAG):$(VERSION)
