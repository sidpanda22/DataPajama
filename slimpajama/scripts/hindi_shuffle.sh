#! /bin/bash
export PYTHONPATH="."
normalied_dir=~/workspace/data_dir/indicorp_processed/hindi/normalized_dir
duplicates=~/workspace/data_dir/indicorp/hindi/duplicates/duplicates.pickle
short_docs=~/workspace/data_dir/indicorp/hindi/filtered_dir/filtered.pickle
out_dir=~/workspace/data_dir/indicorp/datapajama/pass1
python ../preprocessing/shuffle_holdout.py pass1 --input_dir $normalied_dir --duplicates $duplicates --short_docs $short_docs --out_dir $out_dir