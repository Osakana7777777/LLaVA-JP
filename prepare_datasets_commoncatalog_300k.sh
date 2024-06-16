#!/bin/bash

# for Stage1
## STAIR Captions
### キャプションと画像が同時に準備される
rm ./dataset/LLaVA-CC-300k-Caption/llava_cc_300k_caption.json
rm -rf ./dataset/images/cc_300k
rm -rf ./dataset/LLaVA-CC-300k-Caption
mkdir ./dataset/images/cc_300k
mkdir ./dataset/LLaVA-CC-300k-Caption
python tools/prepare_commoncatalog_300k.py
rm ./dataset/cc_300k_dataset.csv
echo "csv deleted"
