sync:
	pipenv sync --dev
	INCLUDE_DATA=false bash sync.sh

test:
	pipenv run python -m pytest tests/

report:
	INCLUDE_DATA=true bash sync.sh
	pipenv run python report_integration.py

build:
	docker build -t edge-validator:latest .

serve:
	docker run -p 8000:8000 -it edge-validator:latest
