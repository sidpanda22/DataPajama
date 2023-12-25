#! /bin/bash
source_dir=~/workspace/data_dir/indicorp/hindi/source_dir
dataset_name=hindi
final_dir=~/workspace/data_dir/indicorp_processed/hindi/
python ../preprocessing/normalize_text.py -d $source_dir -t $final_dir