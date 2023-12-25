#! /bin/bash
source_dir=~/workspace/data_dir/indicorp/hindi/normalized_dir
final_dir=~/workspace/data_dir/indicorp/hindi/filtered_dir
n_docs=5000
dataset_name=indicorp_hindi
threshold=50
python ../preprocessing/filter.py  $source_dir  $final_dir/filtered.pickle $n_docs $dataset_name $threshold