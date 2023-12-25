#! /bin/bash

dataset_name=indicorp_hindi
#  for filtering
n_docs=5000             #number of documents in dataset
threshold=200           #min number of charcters in a doc
# for minhash generation
iter=0                  #job_id
index_start=0           #Start indexing documents from input directory after ls    
index_end=5000          #End indexing documents from input directory after ls
window_size=6           #The window size - ngram size
buffer_size=10000       #Number of batches to output with.
# for duplicates
range=13                #range and bands set acc to  datasketch/lsh.py for aggresive deduplication
bands=9
processes=45

# NFC normalize
source_dir=~/workspace/data_dir/indicorp/hindi/source_dir
normalied_dir=~/workspace/data_dir/indicorp_processed/hindi/normalized_dir
python ../preprocessing/normalize_text.py -d $source_dir -t $normalied_dir

# Filter short docs
filtered_dir=~/workspace/data_dir/indicorp/hindi/filtered_dir
python ../preprocessing/filter.py  $normalied_dir  $filtered_dir/filtered.pickle $n_docs $dataset_name $threshold

# Generate minhash
min_hash_dir=~/workspace/data_dir/indicorp/hindi/min_hash_dir
python ../dedup/to_hash.py \
    $dataset_name $normalized_dir $min_hash_dir $n_docs $iter $index_start $index_end -w $window_size -k $buffer_size

# Generate duplicates
duplicates_input_dir=~/workspace/data_dir/indicorp/hindi/min_hash_dir
duplicate_pairs=~/workspace/data_dir/indicorp/hindi/duplicates/duplicate_pairs.txt
python ../dedup/generate_duplicate_pairs.py \
    --input_dir $duplicates_input_dir --out_file $duplicate_pairs --range $range --bands $bands --processes $processes

dup_dir=~/workspace/data_dir/indicorp/hindi/duplicates
connected_components=~/workspace/data_dir/indicorp/hindi/duplicates/connected_components.pickle
python ../dedup/generate_connected_components.py \
    --input_dir $dup_dir --out_file $connected_components

duplicates=~/workspace/data_dir/indicorp/hindi/duplicates/duplicates.pickle
python ../dedup/generate_duplicates_dict.py --input_file $connected_components --out_file $duplicates 

# interleave and shuffle: mix the sources together with specified weights
#python preprocessing/shuffle_holdout.py pass1 --input_dir <prefix_path>/RedPajama_norm/ --duplicates <prefix_path>/redpj_duplicates/duplicates.pickle --short_docs <prefix_path>/RedPajama_filtered.pickle --out_dir <prefix_path>/SlimPajama/pass1