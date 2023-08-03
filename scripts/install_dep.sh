# bin/bash

## dependencies for image line extraction
sudo apt-get install rename
python3 -m venv env
source env/bin/activate
python3 pip install -U pip
python3 pip install hocr-tools
deactivate