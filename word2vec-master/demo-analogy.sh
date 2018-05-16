make
#if [ ! -e text8 ]; then
 # wget http://mattmahoney.net/dc/text8.zip -O text8.gz
 # gzip -d text8.gz -f
#fi
echo ---------------------------------------------------------------------------------------------------
echo Note that for the word analogy to perform well, the model should be trained on much larger data set
echo Example input: paris france berlin
echo ---------------------------------------------------------------------------------------------------
time ./word2vec -train /haplox/users/wuhm/ASCO/Abs.txt -output /haplox/users/wuhm/ASCO/Abs_ana.txt -cbow 0 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15
./word-analogy /haplox/users/wuhm/ASCO/Abs_ana.txt
