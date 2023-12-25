#! /bin/bash
input_file=/Users/sid/workspace/data_dir/indicorp/hindi/duplicates/connected_components.pickle
out_file=/Users/sid/workspace/data_dir/indicorp/hindi/duplicates/duplicates.pickle
python ../dedup/generate_duplicates_dict.py --input_file $input_file --out_file $out_file 