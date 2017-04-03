.PHONY: deps_ubuntu
deps_ubuntu:
	sudo apt-get install python3 python3-pip python3-venv python3-pandas

.PHONY: create_venv
create_venv:
	python3 -m venv ./env
	echo "Run `source ./env/bin/activate` each time you begin work`"
    
.PHONY: python_deps
python_deps:
	echo "Run `source ./env/bin/activate`"
	echo "Run `pip3 install --upgrade pip`"
	echo "Run `pip3 install -r requirements.txt`"

.PHONY: clean
clean:
	py3clean ./frc-rekt/

.PHONY: pytest
pytest:
	pytest --color='yes' ./frc-rekt/

.PHONY: format
format:
	yapf --in-place --recursive --style pep8 ./frc-rekt/

.PHONY: init
init: deps_ubuntu create_venv

.PHONY: test
test: clean format pytest

