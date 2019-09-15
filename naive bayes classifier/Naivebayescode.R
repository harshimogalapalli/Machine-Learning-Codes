
> library(readr)

> sms_spam <- read_csv("Machine-Learning-with-R-Third-Edition-master/Chapter04/sms_spam.csv")
Parsed with column specification:
cols(
  type = col_character(),
  text = col_character()
)

> View(sms_spam)

> str(sms_spam)
Classes ‘spec_tbl_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	5559 obs. of  2 variables:
 $ type: chr  "ham" "ham" "ham" "spam" ...
 $ text: chr  "Hope you are having a good week. Just checking in" "K..give back my thanks." "Am also doing in cbe only. But have to pay." "complimentary 4 STAR Ibiza Holiday or £10,000 cash needs your URGENT collection. 09066364349 NOW from Landline "| __truncated__ ...
 - attr(*, "spec")=
  .. cols(
  ..   type = col_character(),
  ..   text = col_character()
  .. )
 
 
> sms_spam$type <- factor(sms_spam$type)

> str(sms_spam$type)
 Factor w/ 2 levels "ham","spam": 1 1 1 2 2 1 1 1 2 1 ...
 
 > table(sms_spam$type)

 ham spam 
4812  747

>install.packages("tm")
>library(tm)

> sms_corpus<-VCorpus(VectorSource(sms_spam$text))

> print(sms_corpus)
<<VCorpus>>
Metadata:  corpus specific: 0, document level (indexed): 0
Content:  documents: 5559

> inspect(sms_corpus[1:2])
<<VCorpus>>
Metadata:  corpus specific: 0, document level (indexed): 0
Content:  documents: 2

[[1]]
<<PlainTextDocument>>
Metadata:  7
Content:  chars: 49

[[2]]
<<PlainTextDocument>>
Metadata:  7
Content:  chars: 23



> as.character(sms_corpus[[1]])
[1] "Hope you are having a good week. Just checking in"
> lapply(sms_corpus[1:2], as.character)
$`1`
[1] "Hope you are having a good week. Just checking in"

$`2`
[1] "K..give back my thanks."

> sms_corpus_clean<-tm_map(sms_corpus,content_transformer(tolower))
> lapply(sms_corpus_clean[1:2], as.character)
$`1`
[1] "hope you are having a good week. just checking in"

$`2`
[1] "k..give back my thanks."

> sms_corpus_clean<-tm_map(sms_corpus_clean,removeNumbers)
> sms_corpus_clean<-tm_map(sms_corpus_clean,removeWords,stopwords())
> lapply(sms_corpus_clean[1:2], as.character)
$`1`
[1] "hope     good week. just checking "

$`2`
[1] "k..give back  thanks."

> sms_corpus_clean<-tm_map(sms_corpus_clean,removePunctuation)
> lapply(sms_corpus_clean[1:2], as.character)
$`1`
[1] "hope     good week just checking "

$`2`
[1] "kgive back  thanks"


> replacePunctuation<- function(x){gsub("[[:punct:]]+", " ",x)}

> replacePunctuation("hello...world")
[1] "hello world"


> install.packages("SnowballC")
>library(SnowballC)

> wordStem(c("learn","learning","learnt","learned"))
[1] "learn"  "learn"  "learnt" "learn"

> sms_corpus_clean<-tm_map(sms_corpus_clean,stemDocument)
> sms_corpus_clean<-tm_map(sms_corpus_clean,stripWhitespace)
> lapply(sms_corpus_clean[1:4], as.character)
$`1`
[1] "hope good week just check"

$`2`
[1] "kgive back thank"

$`3`
[1] "also cbe pay"

$`4`
[1] "complimentari star ibiza holiday £ cash need urgent collect now landlin lose boxskwpppm"

> sms_dtm<-DocumentTermMatrix(sms_corpus_clean)


> sms_dtm_train <- sms_dtm[1:4169, ]
> sms_dtm_test  <- sms_dtm[4170:5559, ]


> sms_train_labels <- sms_spam[1:4169, ]$type
> sms_test_labels  <- sms_spam[4170:5559, ]$type

> prop.table(table(sms_train_labels))
sms_train_labels
      ham      spam 
0.8647158 0.1352842 
> prop.table(table(sms_test_labels))
sms_test_labels
      ham      spam 
0.8683453 0.1316547 

>install.packages("wordcloud")
>library(wordcloud)


> ham<-subset(sms_spam,type=="ham")
> spam<-subset(sms_spam,type=="spam")


> wordcloud::wordcloud(spam$text,max.words=40,scale=c(3,0.5))
Warning messages:
1: In tm_map.SimpleCorpus(corpus, tm::removePunctuation) :
  transformation drops documents
2: In tm_map.SimpleCorpus(corpus, function(x) tm::removeWords(x, tm::stopwords())) :
  transformation drops documents
  
> wordcloud(ham$text,max.words=40,scale=c(3,0.5))

findFreqTerms(sms_dtm_train,5)
   [1] "£wk"                 "abiola"              "abl"                
   [4] "abt"                 "accept"              "access"             
  ......
  

> sms_freq_words<-findFreqTerms(sms_dtm_train,5)
> str(sms_freq_words)
 chr [1:1137] "£wk" "abiola" "abl" "abt" "accept" "access" "account" "across" "act" ...

>convert_counts <- function(x) {
+  x <- ifelse(x > 0, "Yes", "No")
+ }

>sms_train <- apply(sms_dtm_freq_train, MARGIN = 2, convert_counts)
>sms_test  <- apply(sms_dtm_freq_test, MARGIN = 2, convert_counts)

>install.packages("e1071")
>library(e1071)

>sms_classifier <- naiveBayes(sms_train, sms_train_labels)

> sms_predictions<-predict(sms_classifier,sms_test)


> library(gmodels)
> CrossTable(sms_predictions,sms_test_labels,prop.chisq = FALSE,prop.r = FALSE,dnn=c('predictedresult','actualresult'))

 
   Cell Contents
|-------------------------|
|                       N |
|           N / Col Total |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  1390 

 
                | actualresult 
predictedresult |       ham |      spam | Row Total | 
----------------|-----------|-----------|-----------|
            ham |      1201 |        30 |      1231 | 
                |     0.995 |     0.164 |           | 
                |     0.864 |     0.022 |           | 
----------------|-----------|-----------|-----------|
           spam |         6 |       153 |       159 | 
                |     0.005 |     0.836 |           | 
                |     0.004 |     0.110 |           | 
----------------|-----------|-----------|-----------|
   Column Total |      1207 |       183 |      1390 | 
                |     0.868 |     0.132 |           | 
----------------|-----------|-----------|-----------|

>sms_classifier2 <- naiveBayes(sms_train, sms_train_labels, laplace = 1)
>sms_test_pred2 <- predict(sms_classifier2, sms_test)
>CrossTable(sms_test_pred2, sms_test_labels, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('predicted', 'actual'))

  
   Cell Contents
|-------------------------|
|                       N |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  1390 

 
             | actual 
   predicted |       ham |      spam | Row Total | 
-------------|-----------|-----------|-----------|
         ham |      1202 |        28 |      1230 | 
             |     0.865 |     0.020 |           | 
-------------|-----------|-----------|-----------|
        spam |         5 |       155 |       160 | 
             |     0.004 |     0.112 |           | 
-------------|-----------|-----------|-----------|
Column Total |      1207 |       183 |      1390 | 
-------------|-----------|-----------|-----------|

