.POSIX:
.SUFFIXES:

.PHONY: default
default: build

.PHONY: build
build: clean
	# install dependencies into build/ dir
	python3 -m pip install -q -r requirements.txt --target build
	# add project code to build/ dir
	cp -r lambda_function.py foo/ build/
	# strip out unnecessary metadata
	rm -fr build/*.dist-info/
	# zip everything together using Python's zipfile module
	python3 -m zipfile -c my-deployment-package.zip build/*

.PHONY: clean
clean:
	rm -fr my-deployment-package.zip build/
