#! /bin/bash

echo "Normalizing..."
sh ./hindi_normalize.sh

echo "Filtering short docs"
sh ./hindi_filter.sh

echo "Generating minhash"
sh ./min_Hash_gen.sh

echo "Generate duplicates"
sh ./hindi_duplicate_pairsgen.sh
sh ./hindi_dup_graphs.sh
sh ./hindi_gen_dup.sh