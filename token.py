#!/usr/bin/python3
# encoding: utf-8

import importlib,sys
importlib.reload(sys)
import nltk

te = open('/haplox/users/wuhm/ASCO/Abs.txt','a')
text = open('/haplox/users/wuhm/ASCO/2017ASCOAbstracts.txt','r')
pattern = r"""(?x)                   # set flag to allow verbose regexps 
               (?:[A-Z]\.)+           # abbreviations, e.g. U.S.A. 
               |\d+(?:\.\d+)?%?       # numbers, incl. currency and percentages 
               |\w+(?:[-']\w+)*       # words w/ optional internal hyphens/apostrophe 
               |(?:[-_])    # special characters with meanings
             """

#将停用词表转成list
f_stop = open('/haplox/users/wuhm/ASCO/English_stops.txt','r')
f_stop_list = []
for line in f_stop:
    f_stop_list.append(line.split('\n')[0].split(' ')[0])

for line in text:
    disease_list = nltk.regexp_tokenize(line, pattern)   #进行正则化分词
    filtered = [w+' ' for w in disease_list if(w not in f_stop_list)]
    te.writelines(filtered)
    
