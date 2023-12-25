#! /bin/bash
input_dir=/Users/sid/workspace/data_dir/indicorp/hindi/min_hash_dir
out_file=/Users/sid/workspace/data_dir/indicorp/hindi/duplicates/duplicate_pairs.txt
range=13
bands=9
processes=45


python ../dedup/generate_duplicate_pairs.py --input_dir $input_dir --out_file $out_file --range $range --bands $bands --processes $processes