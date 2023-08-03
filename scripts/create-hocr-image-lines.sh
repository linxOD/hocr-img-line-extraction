# bin/bash

SOURCE="./my_img/"
lang=$MODEL_LANG
echo $TESSDATA_PREFIX # create env variable pointint to tessdata with traineddata files
set -- "$SOURCE"*.tif
for img_file; do
    echo -e  "\r\n File: $img_file"
    OMP_THREAD_LIMIT=1 tesseract --tessdata-dir $TESSDATA_PREFIX "${img_file}" "${img_file%.*}"  --psm 6  --oem 1  -l $lang -c page_separator='' hocr
    PYTHONIOENCODING=UTF-8 hocr-extract-images -b $SOURCE -p "${img_file%.*}"-%03d.exp0.tif  "${img_file%.*}".hocr 
done
rename s/exp0.txt/exp0.gt.txt/ ./my_img/*exp0.txt
mkdir ./my_img/ground-truth
mv ./my_img/*exp0.gt.txt ./my_img/ground-truth/
mv ./my_img/*exp0.tif ./my_img/ground-truth/
rm ./my_img/*.hocr

echo "Image files converted to tif. Correct the ground truth files and then run ocr-d train to create box and lstmf files"