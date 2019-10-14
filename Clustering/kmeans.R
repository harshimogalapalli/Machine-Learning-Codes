snsdata <- read_csv("Machine-Learning-with-R-Third-Edition-master/Chapter09/snsdata.csv")
Parsed with column specification:
cols(
  .default = col_double(),
  gender = col_character()
)
See spec(...) for full column specifications.
> View(snsdata)
> teens<-snsdata
> sr(teens)
Error in sr(teens) : could not find function "sr"
> str(teens)
Classes ‘spec_tbl_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	30000 obs. of  40 variables:
 $ gradyear    : num  2006 2006 2006 2006 2006 ...
 $ gender      : chr  "M" "F" "M" "F" ...
 $ age         : num  19 18.8 18.3 18.9 19 ...
 $ friends     : num  7 0 69 0 10 142 72 17 52 39 ...
 $ basketball  : num  0 0 0 0 0 0 0 0 0 0 ...
 $ football    : num  0 1 1 0 0 0 0 0 0 0 ...
 $ soccer      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ softball    : num  0 0 0 0 0 0 0 1 0 0 ...
 $ volleyball  : num  0 0 0 0 0 0 0 0 0 0 ...
 $ swimming    : num  0 0 0 0 0 0 0 0 0 0 ...
 $ cheerleading: num  0 0 0 0 0 0 0 0 0 0 ...
 $ baseball    : num  0 0 0 0 0 0 0 0 0 0 ...
 $ tennis      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ sports      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ cute        : num  0 1 0 1 0 0 0 0 0 1 ...
 $ sex         : num  0 0 0 0 1 1 0 2 0 0 ...
 $ sexy        : num  0 0 0 0 0 0 0 1 0 0 ...
 $ hot         : num  0 0 0 0 0 0 0 0 0 1 ...
 $ kissed      : num  0 0 0 0 5 0 0 0 0 0 ...
 $ dance       : num  1 0 0 0 1 0 0 0 0 0 ...
 $ band        : num  0 0 2 0 1 0 1 0 0 0 ...
 $ marching    : num  0 0 0 0 0 1 1 0 0 0 ...
 $ music       : num  0 2 1 0 3 2 0 1 0 1 ...
 $ rock        : num  0 2 0 1 0 0 0 1 0 1 ...
 $ god         : num  0 1 0 0 1 0 0 0 0 6 ...
 $ church      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ jesus       : num  0 0 0 0 0 0 0 0 0 2 ...
 $ bible       : num  0 0 0 0 0 0 0 0 0 0 ...
 $ hair        : num  0 6 0 0 1 0 0 0 0 1 ...
 $ dress       : num  0 4 0 0 0 1 0 0 0 0 ...
 $ blonde      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ mall        : num  0 1 0 0 0 0 2 0 0 0 ...
 $ shopping    : num  0 0 0 0 2 1 0 0 0 1 ...
 $ clothes     : num  0 0 0 0 0 0 0 0 0 0 ...
 $ hollister   : num  0 0 0 0 0 0 2 0 0 0 ...
 $ abercrombie : num  0 0 0 0 0 0 0 0 0 0 ...
 $ die         : num  0 0 0 0 0 0 0 0 0 0 ...
 $ death       : num  0 0 1 0 0 0 0 0 0 0 ...
 $ drunk       : num  0 0 0 0 1 1 0 0 0 0 ...
 $ drugs       : num  0 0 0 0 1 0 0 0 0 0 ...
 - attr(*, "spec")=
  .. cols(
  ..   gradyear = col_double(),
  ..   gender = col_character(),
  ..   age = col_double(),
  ..   friends = col_double(),
  ..   basketball = col_double(),
  ..   football = col_double(),
  ..   soccer = col_double(),
  ..   softball = col_double(),
  ..   volleyball = col_double(),
  ..   swimming = col_double(),
  ..   cheerleading = col_double(),
  ..   baseball = col_double(),
  ..   tennis = col_double(),
  ..   sports = col_double(),
  ..   cute = col_double(),
  ..   sex = col_double(),
  ..   sexy = col_double(),
  ..   hot = col_double(),
  ..   kissed = col_double(),
  ..   dance = col_double(),
  ..   band = col_double(),
  ..   marching = col_double(),
  ..   music = col_double(),
  ..   rock = col_double(),
  ..   god = col_double(),
  ..   church = col_double(),
  ..   jesus = col_double(),
  ..   bible = col_double(),
  ..   hair = col_double(),
  ..   dress = col_double(),
  ..   blonde = col_double(),
  ..   mall = col_double(),
  ..   shopping = col_double(),
  ..   clothes = col_double(),
  ..   hollister = col_double(),
  ..   abercrombie = col_double(),
  ..   die = col_double(),
  ..   death = col_double(),
  ..   drunk = col_double(),
  ..   drugs = col_double()
  .. )
  
> table(teens$gender)

    F     M 
22054  5222 
> table(teens$gender,useNA="ifany")

    F     M  <NA> 
22054  5222  2724 
> summary(teens$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  3.086  16.312  17.287  17.994  18.259 106.927    5086 
  
> teens$age<-ifelse(teens$age>=13 & teens$age < 20,teens$age,NA)

> summary(teens$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  13.03   16.30   17.27   17.25   18.22   20.00    5523 

>   teens$female<-ifelse(teens$gender=="F"&!is.na(teens$gender),1,0)
>   teens$no_gender<-ifelse(is.na(teens$gender),1,0)
> mean(teens$age,na.rm=TRUE)
[1] 17.25243
> aggregate(data=teens,age~gradyear,mean,na.rm=TRUE)
  gradyear      age
1     2006 18.65586
2     2007 17.70617
3     2008 16.76770
4     2009 15.81957
> ave_age<-ave(teens$age,teens$gradyear,FUN=function(x) mean(x,na.rm=TRUE))
> teens$age<-ifelse(is.na(teens$age),ave_age,teens$age)
> summary(teens$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  13.03   16.28   17.24   17.24   18.21   20.00 
  //Training
  
> int<-teens[5:40]
> int_z<-as.data.frame(lapply(int,scale))
> set.seed(2345)
> cluster<-kmeans(int_z,5)


> cluster$size
[1]   871   600  5981  1034 21514

> cluster$centers
   basketball   football      soccer    softball  volleyball    swimming cheerleading
1  0.16001227  0.2364174  0.10385512  0.07232021  0.18897158  0.23970234    0.3931445
2 -0.09195886  0.0652625 -0.09932124 -0.01739428 -0.06219308  0.03339844   -0.1101103
3  0.52755083  0.4873480  0.29778605  0.37178877  0.37986175  0.29628671    0.3303485
4  0.34081039  0.3593965  0.12722250  0.16384661  0.11032200  0.26943332    0.1856664
5 -0.16695523 -0.1641499 -0.09033520 -0.11367669 -0.11682181 -0.10595448   -0.1136077
     baseball      tennis      sports        cute          sex        sexy         hot
1  0.02993479  0.13532387  0.10257837  0.37884271  0.020042068  0.11740551  0.41389104
2 -0.11487510  0.04062204 -0.09899231 -0.03265037 -0.042486141 -0.04329091 -0.03812345
3  0.35231971  0.14057808  0.32967130  0.54442929  0.002913623  0.24040196  0.38551819
4  0.27527088  0.10980958  0.79711920  0.47866008  2.028471066  0.51266080  0.31708549
5 -0.10918483 -0.05097057 -0.13135334 -0.18878627 -0.097928345 -0.09501817 -0.13810894
       kissed       dance        band    marching      music        rock         god
1  0.06787768  0.22780899 -0.10257102 -0.10942590  0.1378306  0.05905951  0.03651755
2 -0.04554933  0.04573186  4.06726666  5.25757242  0.4981238  0.15963917  0.09283620
3 -0.03356121  0.45662534 -0.02120728 -0.10880541  0.2844999  0.21436936  0.35014919
4  2.97973077  0.45535061  0.38053621 -0.02014608  1.1367885  1.21013948  0.41679142
5 -0.13535855 -0.15932739 -0.12167214 -0.11098063 -0.1532006 -0.12460034 -0.12144246
       church       jesus       bible        hair       dress      blonde        mall
1 -0.00709374  0.01458533 -0.03692278  0.43807926  0.14905267  0.06137340  0.60368108
2  0.06414651  0.04801941  0.05863810 -0.04484083  0.07201611 -0.01146396 -0.08724304
3  0.53739806  0.27843424  0.22990963  0.23612853  0.39407628  0.03471458  0.48318495
4  0.16627797  0.12988313  0.08478769  2.55623737  0.53852195  0.36134138  0.62256686
5 -0.15889274 -0.08557822 -0.06813159 -0.20498730 -0.14348036 -0.02918252 -0.18625656
     shopping       clothes  hollister abercrombie          die       death        drunk
1  0.79806891  0.5651537331  4.1521844  3.96493810  0.043475966  0.09857501  0.035614771
2 -0.03865318 -0.0003526292 -0.1678300 -0.14129577  0.009447317  0.05135888 -0.086773220
3  0.66327838  0.3759725120 -0.0553846 -0.07417839  0.037989066  0.11972190 -0.009688746
4  0.27101815  1.2306917174  0.1610784  0.26324494  1.712181870  0.93631312  1.897388200
5 -0.22865236 -0.1865419798 -0.1557662 -0.14861104 -0.094875180 -0.08370729 -0.087520105
        drugs
1  0.03443294
2 -0.06878491
3 -0.05973769
4  2.73326605
5 -0.11423381

//improving performance

> teens$cluster<-cluster$cluster

> teens[1:5,c("cluster","gender","age","friends")]
# A tibble: 5 x 4
  cluster gender   age friends
    <int> <chr>  <dbl>   <dbl>
1       5 M       19.0       7
2       3 F       18.8       0
3       5 M       18.3      69
4       5 F       18.9       0
5       4 NA      19.0      10
> teens<-read.csv("snsdata.csv")
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
In file(file, "rt") :
  cannot open file 'snsdata.csv': No such file or directory
> library(readr)
> snsdata <- read_csv("Machine-Learning-with-R-Third-Edition-master/Chapter09/snsdata.csv")
Parsed with column specification:
cols(
  .default = col_double(),
  gender = col_character()
)
See spec(...) for full column specifications.
> View(snsdata)
> teens<-snsdata
> sr(teens)
Error in sr(teens) : could not find function "sr"
> str(teens)
Classes ‘spec_tbl_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	30000 obs. of  40 variables:
 $ gradyear    : num  2006 2006 2006 2006 2006 ...
 $ gender      : chr  "M" "F" "M" "F" ...
 $ age         : num  19 18.8 18.3 18.9 19 ...
 $ friends     : num  7 0 69 0 10 142 72 17 52 39 ...
 $ basketball  : num  0 0 0 0 0 0 0 0 0 0 ...
 $ football    : num  0 1 1 0 0 0 0 0 0 0 ...
 $ soccer      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ softball    : num  0 0 0 0 0 0 0 1 0 0 ...
 $ volleyball  : num  0 0 0 0 0 0 0 0 0 0 ...
 $ swimming    : num  0 0 0 0 0 0 0 0 0 0 ...
 $ cheerleading: num  0 0 0 0 0 0 0 0 0 0 ...
 $ baseball    : num  0 0 0 0 0 0 0 0 0 0 ...
 $ tennis      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ sports      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ cute        : num  0 1 0 1 0 0 0 0 0 1 ...
 $ sex         : num  0 0 0 0 1 1 0 2 0 0 ...
 $ sexy        : num  0 0 0 0 0 0 0 1 0 0 ...
 $ hot         : num  0 0 0 0 0 0 0 0 0 1 ...
 $ kissed      : num  0 0 0 0 5 0 0 0 0 0 ...
 $ dance       : num  1 0 0 0 1 0 0 0 0 0 ...
 $ band        : num  0 0 2 0 1 0 1 0 0 0 ...
 $ marching    : num  0 0 0 0 0 1 1 0 0 0 ...
 $ music       : num  0 2 1 0 3 2 0 1 0 1 ...
 $ rock        : num  0 2 0 1 0 0 0 1 0 1 ...
 $ god         : num  0 1 0 0 1 0 0 0 0 6 ...
 $ church      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ jesus       : num  0 0 0 0 0 0 0 0 0 2 ...
 $ bible       : num  0 0 0 0 0 0 0 0 0 0 ...
 $ hair        : num  0 6 0 0 1 0 0 0 0 1 ...
 $ dress       : num  0 4 0 0 0 1 0 0 0 0 ...
 $ blonde      : num  0 0 0 0 0 0 0 0 0 0 ...
 $ mall        : num  0 1 0 0 0 0 2 0 0 0 ...
 $ shopping    : num  0 0 0 0 2 1 0 0 0 1 ...
 $ clothes     : num  0 0 0 0 0 0 0 0 0 0 ...
 $ hollister   : num  0 0 0 0 0 0 2 0 0 0 ...
 $ abercrombie : num  0 0 0 0 0 0 0 0 0 0 ...
 $ die         : num  0 0 0 0 0 0 0 0 0 0 ...
 $ death       : num  0 0 1 0 0 0 0 0 0 0 ...
 $ drunk       : num  0 0 0 0 1 1 0 0 0 0 ...
 $ drugs       : num  0 0 0 0 1 0 0 0 0 0 ...
 - attr(*, "spec")=
  .. cols(
  ..   gradyear = col_double(),
  ..   gender = col_character(),
  ..   age = col_double(),
  ..   friends = col_double(),
  ..   basketball = col_double(),
  ..   football = col_double(),
  ..   soccer = col_double(),
  ..   softball = col_double(),
  ..   volleyball = col_double(),
  ..   swimming = col_double(),
  ..   cheerleading = col_double(),
  ..   baseball = col_double(),
  ..   tennis = col_double(),
  ..   sports = col_double(),
  ..   cute = col_double(),
  ..   sex = col_double(),
  ..   sexy = col_double(),
  ..   hot = col_double(),
  ..   kissed = col_double(),
  ..   dance = col_double(),
  ..   band = col_double(),
  ..   marching = col_double(),
  ..   music = col_double(),
  ..   rock = col_double(),
  ..   god = col_double(),
  ..   church = col_double(),
  ..   jesus = col_double(),
  ..   bible = col_double(),
  ..   hair = col_double(),
  ..   dress = col_double(),
  ..   blonde = col_double(),
  ..   mall = col_double(),
  ..   shopping = col_double(),
  ..   clothes = col_double(),
  ..   hollister = col_double(),
  ..   abercrombie = col_double(),
  ..   die = col_double(),
  ..   death = col_double(),
  ..   drunk = col_double(),
  ..   drugs = col_double()
  .. )
> table(teens$gender)

    F     M 
22054  5222 
> table(teens$gender,useNA="ifany")

    F     M  <NA> 
22054  5222  2724 
> summary(teens$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  3.086  16.312  17.287  17.994  18.259 106.927    5086 
> eens$age<-ifelse(teens$age>=13 & teens$age < 20,teens$age,NA)
Error in eens$age <- ifelse(teens$age >= 13 & teens$age < 20, teens$age,  : 
  object 'eens' not found
> teens$age<-ifelse(teens$age>=13 & teens$age < 20,teens$age,NA)
> summaery(teens$age)
Error in summaery(teens$age) : could not find function "summaery"
> summary(teens$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  13.03   16.30   17.27   17.25   18.22   20.00    5523 
>   teens$female<-ifelse(teens$gender=="F"&!is.na(teens$gender),1,0)
>   teens$no_gender<-ifelse(is.na(teens$gender),1,0)
> mean(teen$age,na.rm=TRUE)
Error in mean(teen$age, na.rm = TRUE) : object 'teen' not found
> mean(teens$age,na.rm=TRUE)
[1] 17.25243
> aggregate(data=teens,age~gradyear,mean,na.rm=TRUE)
  gradyear      age
1     2006 18.65586
2     2007 17.70617
3     2008 16.76770
4     2009 15.81957
> ave_age<-ave(teens$age,teens$gradyear,FUN=function(x) mean(x,na.rm=TRUE))
> teens$age<-ifelse(is.na(tee))
Error in ifelse(is.na(tee)) : object 'tee' not found
> teens$age<-ifelse(is.na(tees$age),ave_age,teens$age)
Error in ifelse(is.na(tees$age), ave_age, teens$age) : 
  object 'tees' not found
> teens$age<-ifelse(is.na(teens$age),ave_age,teens$age)
> summary(teens$age)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  13.03   16.28   17.24   17.24   18.21   20.00 
> int<-teens[5:40]
> int_z<-as.data.frame(lapply(int,scale))
> set.seed(2345)
> cluster<-kmeans(int_z,5)
> cluster$size
[1]   871   600  5981  1034 21514
> cluster$centers
   basketball   football      soccer    softball  volleyball    swimming cheerleading
1  0.16001227  0.2364174  0.10385512  0.07232021  0.18897158  0.23970234    0.3931445
2 -0.09195886  0.0652625 -0.09932124 -0.01739428 -0.06219308  0.03339844   -0.1101103
3  0.52755083  0.4873480  0.29778605  0.37178877  0.37986175  0.29628671    0.3303485
4  0.34081039  0.3593965  0.12722250  0.16384661  0.11032200  0.26943332    0.1856664
5 -0.16695523 -0.1641499 -0.09033520 -0.11367669 -0.11682181 -0.10595448   -0.1136077
     baseball      tennis      sports        cute          sex        sexy         hot
1  0.02993479  0.13532387  0.10257837  0.37884271  0.020042068  0.11740551  0.41389104
2 -0.11487510  0.04062204 -0.09899231 -0.03265037 -0.042486141 -0.04329091 -0.03812345
3  0.35231971  0.14057808  0.32967130  0.54442929  0.002913623  0.24040196  0.38551819
4  0.27527088  0.10980958  0.79711920  0.47866008  2.028471066  0.51266080  0.31708549
5 -0.10918483 -0.05097057 -0.13135334 -0.18878627 -0.097928345 -0.09501817 -0.13810894
       kissed       dance        band    marching      music        rock         god
1  0.06787768  0.22780899 -0.10257102 -0.10942590  0.1378306  0.05905951  0.03651755
2 -0.04554933  0.04573186  4.06726666  5.25757242  0.4981238  0.15963917  0.09283620
3 -0.03356121  0.45662534 -0.02120728 -0.10880541  0.2844999  0.21436936  0.35014919
4  2.97973077  0.45535061  0.38053621 -0.02014608  1.1367885  1.21013948  0.41679142
5 -0.13535855 -0.15932739 -0.12167214 -0.11098063 -0.1532006 -0.12460034 -0.12144246
       church       jesus       bible        hair       dress      blonde        mall
1 -0.00709374  0.01458533 -0.03692278  0.43807926  0.14905267  0.06137340  0.60368108
2  0.06414651  0.04801941  0.05863810 -0.04484083  0.07201611 -0.01146396 -0.08724304
3  0.53739806  0.27843424  0.22990963  0.23612853  0.39407628  0.03471458  0.48318495
4  0.16627797  0.12988313  0.08478769  2.55623737  0.53852195  0.36134138  0.62256686
5 -0.15889274 -0.08557822 -0.06813159 -0.20498730 -0.14348036 -0.02918252 -0.18625656
     shopping       clothes  hollister abercrombie          die       death        drunk
1  0.79806891  0.5651537331  4.1521844  3.96493810  0.043475966  0.09857501  0.035614771
2 -0.03865318 -0.0003526292 -0.1678300 -0.14129577  0.009447317  0.05135888 -0.086773220
3  0.66327838  0.3759725120 -0.0553846 -0.07417839  0.037989066  0.11972190 -0.009688746
4  0.27101815  1.2306917174  0.1610784  0.26324494  1.712181870  0.93631312  1.897388200
5 -0.22865236 -0.1865419798 -0.1557662 -0.14861104 -0.094875180 -0.08370729 -0.087520105
        drugs
1  0.03443294
2 -0.06878491
3 -0.05973769
4  2.73326605
5 -0.11423381
> teens$cluster<-cluster$cluster
> teens[1:5,c("c","gend","age","freinds")]
Error: Can't find columns `c`, `gend`, `freinds` in `.data`.
Call `rlang::last_error()` to see a backtrace
> teens[1:5,c("cluster","gend","age","freinds")]
Error: Can't find columns `gend`, `freinds` in `.data`.
Call `rlang::last_error()` to see a backtrace
> teens[1:5,c("cluster","gender","age","friends")]
# A tibble: 5 x 4
  cluster gender   age friends
    <int> <chr>  <dbl>   <dbl>
1       5 M       19.0       7
2       3 F       18.8       0
3       5 M       18.3      69
4       5 F       18.9       0
5       4 NA      19.0      10
> aggregate(data=teens,age~cluster,mean)
  cluster      age
1       1 16.86497
2       2 17.39037
3       3 17.07656
4       4 17.11957
5       5 17.29849
> aggregate(data=teens,female~cluster,mean)
  cluster    female
1       1 0.8381171
2       2 0.7250000
3       3 0.8378198
4       4 0.8027079
5       5 0.6994515
> aggregate(data=teens,friends~cluster,mean)
  cluster  friends
1       1 41.43054
2       2 32.57333
3       3 37.16185
4       4 30.50290
5       5 27.70052


