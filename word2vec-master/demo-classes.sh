make
#if [ ! -e text8 ]; then
#  wget http://mattmahoney.net/dc/text8.zip -O text8.gz
#  gzip -d text8.gz -f
#fi
time ./word2vec -train /haplox/users/wuhm/ASCO/Abs.txt -output /haplox/users/wuhm/ASCO/Abs_class.txt -cbow 0 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -iter 15 -classes 500
sort /haplox/users/wuhm/ASCO/Abs_class.txt -k 2 -n > /haplox/users/wuhm/ASCO/Abs_class.sorted.txt
echo The word classes were saved to file /haplox/users/wuhm/ASCO/Abs_class.sorted.txt
