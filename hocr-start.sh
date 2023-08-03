# bin/bash

# run this script from the root of the repository
# before running this script, add image files to /my_img as .tif or .png

# install tesseract-ocr
./scripts/install_tesseract.sh

# install dependencies
./scripts/install_dep.sh

# start hocr imge to line extraction
./scripts/create-hocr-image-lines.sh