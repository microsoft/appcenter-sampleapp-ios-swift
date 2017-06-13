
all:
	$(MAKE) clean
	$(MAKE) build

.PHONY:
	build

clean:
	rm -rf build

build:
	bin/make/build.sh

pod-lint:
	bin/make/pod_lint.sh

carthage:
	bin/make/carthage.sh
