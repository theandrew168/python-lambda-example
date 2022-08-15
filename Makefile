.POSIX:
.SUFFIXES:

.PHONY: default
default: build

.PHONY: build
build: clean
	python3 -m pip install -q -r requirements.txt --target build
	cp -r lambda_function.py foo/ build/
	rm -fr build/*.dist-info/
	python3 -m zipfile -c my-deployment-package.zip build/*

.PHONY: clean
clean:
	rm -fr my-deployment-package.zip build/
