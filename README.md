# HOCR IMAGE (PAGE) TEXT LINE EXTRACTION TOOL

This tool creats hocr files, extracts text lines from hOCR files and saves them as images and text files.

## Requirements

see `/scripts/install_dep.sh` and `/scripts/install_tesseract.sh`

* hocr-tools
* rename
* tesseract-ocr
* create environment variables $TESSDATA_PREFIX, $MODEL_LANG and IMG_EXT

The IMG_EXT variable is used to determine the image file extension of the input images. If you want to use .png images, set IMG_EXT to .png. If you want to use .tif images, set IMG_EXT to .tif.

### Environment variables examples

`export TESSDATA_PREFIX=/usr/share/tesseract-ocr/4.00/tessdata`
`export MODEL_LANG=deu`
`export IMG_EXT=tif`

see [Tesseract documentation](https://tesseract-ocr.github.io/tessdoc/Installation.html) for more information

## Usage

* add .tif or .png image files to /my_img directory
* isntall dependencies
* run `./hocr-start.sh`

## Output

* hocr files in `/my_img/my_hocr`
* extracted text lines as images and text in /my_img/ground-truth

## Example

* input image: `/my_img/0001.tif`
* output hocr file: `/my_img/my_hocr/0001.hocr`
* output text line images: `/my_img/ground-truth/0001_0001.tif, /my_img/ground-truth/0001_0002.gt.txt`

## Cleaning

Output files have to be manually checked and cleaned. Verify *.gt.txt files compared to *.png or *.tif files if OCR recognition is correct. Remove *.png or *.tif and *.gt.txt files of wrongly recognized text lines.

## Acknowledgments
https://github.com/tesseract-ocr/tesstrain/issues/7#issuecomment-419714852

## License
[MIT](LICENSE)

