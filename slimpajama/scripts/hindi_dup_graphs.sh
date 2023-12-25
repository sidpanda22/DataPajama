#! /bin/bash
input_dir=/Users/sid/workspace/data_dir/indicorp/hindi/duplicates
out_file=/Users/sid/workspace/data_dir/indicorp/hindi/duplicates/connected_components.pickle
python ../dedup/generate_connected_components.py --input_dir $input_dir --out_file $out_file