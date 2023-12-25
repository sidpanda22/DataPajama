#! /bin/bash
dataset_name=indicorp_hindi
normalized_dir=/Users/sid/workspace/data_dir/indicorp/hindi/normalized_dir
min_hash_dir=/Users/sid/workspace/data_dir/indicorp/hindi/min_hash_dir
n_docs=5000
iter=0
index_start=0
index_end=5000
window_size=6
buffer_size=10000
python ../dedup/to_hash.py \
    $dataset_name $normalized_dir $min_hash_dir $n_docs $iter $index_start $index_end -w $window_size -k $buffer_size