PYTHON_SCRAPERS_DIR = scrapers
PYTHON_VERSION = 3.9
VENV = venv
PYTHON  = $(VENV)/bin/python3
JUPYTER = $(VENV)/bin/jupyter
PIP = $(VENV)/bin/pip
TORONTO_BIDS_SERVER_REVISION = toronto-bids-0.1.0-SNAPSHOT
TORONTO_BIDS_SERVER_DIR = app/server/toronto-bids/toronto-bids
TORONTO_BIDS_SERVER_TARGET_DIR = app/server/toronto-bids/toronto-bids/target
TORONTO_BIDS_SERVER_UBERJAR = $(TORONTO_BIDS_SERVER_TARGET_DIR)/uberjar/$(TORONTO_BIDS_SERVER_REVISION).jar
TORONTO_BIDS_SERVER_UBERJAR_STANDALONE = $(TORONTO_BIDS_SERVER_TARGET_DIR)/uberjar/$(TORONTO_BIDS_SERVER_REVISION)-standalone.jar

setup-py: $(VENV)

run-jupyter-notebook: $(VENV)
	$(JUPYTER) notebook --notebook-dir $(PYTHON_SCRAPERS_DIR)

clean:
	rm -rf $(VENV)
	rm -rf $(TORONTO_BIDS_SERVER_TARGET_DIR)

$(VENV): $(PYTHON_SCRAPERS_DIR)/requirements.txt
	python$(PYTHON_VERSION) -m venv venv
	. $(VENV)/bin/activate
	$(PYTHON) -m pip install -r $(PYTHON_SCRAPERS_DIR)/requirements.txt
	touch $(VENV)

pip-freeze: $(PYTHON_SCRAPERS_DIR)/requirements.txt
	$(PIP) freeze > $(VENV)/requirements.txt

run-server:
	cd $(TORONTO_BIDS_SERVER_DIR) && lein run

build-uberjar: $(TORONTO_BIDS_SERVER_UBERJAR)
	cd $(TORONTO_BIDS_SERVER_DIR) && lein uberjar

.PHONY: run-jupyter-notebook setup-py pip-freeze run-server clean

