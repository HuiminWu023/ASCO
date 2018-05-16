make
#if [ ! -e news.2012.en.shuffled ]; then
#  wget http://www.statmt.org/wmt14/training-monolingual-news-crawl/news.2012.en.shuffled.gz
#  gzip -d news.2012.en.shuffled.gz -f
#fi
#sed -e "s/’/'/g" -e "s/′/'/g" -e "s/''/ /g" < news.2012.en.shuffled | tr -c "A-Za-z'_ \n" " " > news.2012.en.shuffled-norm0
time ./word2phrase -train /haplox/users/wuhm/ASCO/Abs.txt -output /haplox/users/wuhm/ASCO/Abs_phrase.txt -threshold 200 -debug 2
#time ./word2phrase -train /haplox/users/wuhm/ASCO/Abs_phrase.txt -output /haplox/users/wuhm/ASCO/Abs_phrase1.txt -threshold 100 -debug 2
#tr A-Z a-z < /haplox/users/wuhm/ASCO/Abs_phrase.txt > /haplox/users/wuhm/ASCO/Abs_phrase.txt
time ./word2vec -train /haplox/users/wuhm/ASCO/Abs_phrase.txt -output /haplox/users/wuhm/ASCO/Abs_phrase1.txt -cbow 1 -size 200 -window 10 -negative 25 -hs 0 -sample 1e-5 -threads 20 -binary 1 -iter 15
./distance /haplox/users/wuhm/ASCO/Abs_phrase1.txt
