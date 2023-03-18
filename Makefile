install:
	pip install -r requirements.txt

venv:
	python3 --version && python3 -m venv venv

unit-tests:
	python3 -m pytest src/tests/unit/

execute:
	python3 -m src.python_questions