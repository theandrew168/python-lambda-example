.POSIX:
.SUFFIXES:

.PHONY: default
default: build

.PHONY: build
build: clean
	python3 -m pip install -q -r requirements.txt --target build
	cp lambda_function.py build/
	rm -fr build/*.dist-info/
	python3 -m zipfile -c my-deployment-package.zip build/*

.PHONY: clean
clean:
	rm -fr my-deployment-package.zip build/
