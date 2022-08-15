.POSIX:
.SUFFIXES:

.PHONY: default
default: build

# install dependencies into build/ dir
# add project code to build/ dir
# strip out unnecessary metadata
# zip everything together using Python's zipfile module
.PHONY: build
build: clean
	python3 -m pip install -q -r requirements.txt --target build
	cp -r lambda_function.py foo/ build/
	rm -fr build/*.dist-info/
	python3 -m zipfile -c my-deployment-package.zip build/*

.PHONY: clean
clean:
	rm -fr my-deployment-package.zip build/
