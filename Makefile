.PHONY: all \
		setup \
		run \
		lint

venv/bin/activate: ## alias for virtual environment
	python -m venv venv

setup: venv/bin/activate ## project setup
	. venv/bin/activate; pip install pip wheel setuptools
	. venv/bin/activate; pip install -r requirements.txt

run: venv/bin/activate ## run project (dev mode)
	. venv/bin/activate; python entry.py -c ./api/config --reload

lint: venv/bin/activate ## clean code
	. venv/bin/activate; isort .
	. venv/bin/activate; black .
	. venv/bin/activate; flake8 .
	. venv/bin/activate; mypy --exclude='venv' .