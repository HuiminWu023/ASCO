make
#if [ ! -e text8 ]; then
 # wget http://mattmahoney.net/dc/text8.zip -O text8.gz
 # gzip -d text8.gz -f
#fi
time ./word2vec -train /haplox/users/wuhm/ASCO/Abs.txt -output /haplox/users/wuhm/ASCO/Abs_w2v2.txt -cbow 0 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 0 -iter 15
#./distance /haplox/users/wuhm/ASCO/Abs_w2v.txt 
