# bin/bash

source=./my_img/
lang=$MODEL_LANG
ext=$IMG_EXT
echo $IMG_EXT
echo $lang
echo $TESSDATA_PREFIX # create env variable pointint to tessdata with traineddata files
set -- "$source"*.$IMG_EXT
for img_file; do
    echo -e  "\r\n File: $img_file"
    OMP_THREAD_LIMIT=1 tesseract --tessdata-dir $TESSDATA_PREFIX "${img_file}" "${img_file%.*}"  --psm 6  --oem 1  -l $lang -c page_separator='' hocr
    PYTHONIOENCODING=UTF-8 hocr-extract-images -b $source -p "${img_file%.*}"-%03d.exp0.tif  "${img_file%.*}".hocr 
done

rename s/exp0.txt/exp0.gt.txt/ ./my_img/*exp0.txt
mkdir ./my_img/$MODEL_NAME-ground-truth
mv ./my_img/*exp0.gt.txt ./my_img/$MODEL_NAME-ground-truth/
mv ./my_img/*exp0.tif ./my_img/$MODEL_NAME-ground-truth/
mkdir ./my_img/my_hocr
mv ./my_img/*.hocr ./my_img/my_hocr/

cp -r ./my_img/$MODEL_NAME-ground-truth /code/tesstrain-main/data

echo "Image files converted to tif. Correct the ground truth files and then run ocr-d train to create box and lstmf files"