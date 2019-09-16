> library(readr)
> credit <- read_csv("Machine-Learning-with-R-Third-Edition-master/Chapter05/credit.csv")
Parsed with column specification:
cols(
  checking_balance = col_character(),
  months_loan_duration = col_double(),
  credit_history = col_character(),
  purpose = col_character(),
  amount = col_double(),
  savings_balance = col_character(),
  employment_duration = col_character(),
  percent_of_income = col_double(),
  years_at_residence = col_double(),
  age = col_double(),
  other_credit = col_character(),
  housing = col_character(),
  existing_loans_count = col_double(),
  job = col_character(),
  dependents = col_double(),
  phone = col_character(),
  default = col_character()
)
> View(credit)

> str(credit)
Classes ‘spec_tbl_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	1000 obs. of  17 variables:
 $ checking_balance    : chr  "< 0 DM" "1 - 200 DM" "unknown" "< 0 DM" ...
 $ months_loan_duration: num  6 48 12 42 24 36 24 36 12 30 ...
 $ credit_history      : chr  "critical" "good" "critical" "good" ...
 $ purpose             : chr  "furniture/appliances" "furniture/appliances" "education" "furniture/appliances" ...
 $ amount              : num  1169 5951 2096 7882 4870 ...
 $ savings_balance     : chr  "unknown" "< 100 DM" "< 100 DM" "< 100 DM" ...
 $ employment_duration : chr  "> 7 years" "1 - 4 years" "4 - 7 years" "4 - 7 years" ...
 $ percent_of_income   : num  4 2 2 2 3 2 3 2 2 4 ...
 $ years_at_residence  : num  4 2 3 4 4 4 4 2 4 2 ...
 $ age                 : num  67 22 49 45 53 35 53 35 61 28 ...
 $ other_credit        : chr  "none" "none" "none" "none" ...
 $ housing             : chr  "own" "own" "own" "other" ...
 $ existing_loans_count: num  2 1 1 1 2 1 1 1 1 2 ...
 $ job                 : chr  "skilled" "skilled" "unskilled" "skilled" ...
 $ dependents          : num  1 1 2 2 2 2 1 1 1 1 ...
 $ phone               : chr  "yes" "no" "no" "no" ...
 $ default             : chr  "no" "yes" "no" "no" ...
 - attr(*, "spec")=
  .. cols(
  ..   checking_balance = col_character(),
  ..   months_loan_duration = col_double(),
  ..   credit_history = col_character(),
  ..   purpose = col_character(),
  ..   amount = col_double(),
  ..   savings_balance = col_character(),
  ..   employment_duration = col_character(),
  ..   percent_of_income = col_double(),
  ..   years_at_residence = col_double(),
  ..   age = col_double(),
  ..   other_credit = col_character(),
  ..   housing = col_character(),
  ..   existing_loans_count = col_double(),
  ..   job = col_character(),
  ..   dependents = col_double(),
  ..   phone = col_character(),
  ..   default = col_character()
  .. )

> RNGversion("3.5.2")
Warning message:
In RNGkind("Mersenne-Twister", "Inversion", "Rounding") :
  non-uniform 'Rounding' sampler used
> set.seed(123)
> train_sample<-sample(1000,900)
> str(train_sample)
 int [1:900] 288 788 409 881 937 46 525 887 548 453 ...

> credit_train<-credit[train_sample,]
> credit_test<-credit[-train_sample,]
> prop.table(table(credit_train$default))

       no       yes 
0.7033333 0.2966667 
> prop.table(table(credit_test$default))

  no  yes 
0.67 0.33 
>install.packages("C50")
>library(C50)


> install.packages("C50", version = "0.1.0-24", repos = "http://cran.us.r-project.org")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
Installing package into ‘C:/Users/HARSHIT/Documents/R/win-library/3.6’
(as ‘lib’ is unspecified)
trying URL 'http://cran.us.r-project.org/bin/windows/contrib/3.6/C50_0.1.2.zip'
Content type 'application/zip' length 604431 bytes (590 KB)
downloaded 590 KB

package ‘C50’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\HARSHIT\AppData\Local\Temp\RtmpCSwwf0\downloaded_packages
> credit_model<-C5.0(x = credit_train[-17],y = credit_train$default)
Error in C5.0(x = credit_train[-17], y = credit_train$default) : 
  could not find function "C5.0"
> library(C50)
> credit_model<-C5.0(x = credit_train[-17],y = credit_train$default)
> credit_model

Call:
C5.0.default(x = credit_train[-17], y = credit_train$default)

Classification Tree
Number of samples: 900 
Number of predictors: 16 

Tree size: 57 

Non-standard options: attempt to group attributes


> summary(credit_model)

Call:
C5.0.default(x = credit_train[-17], y = credit_train$default)


C5.0 [Release 2.07 GPL Edition]  	Mon Sep 16 21:20:30 2019
-------------------------------

Class specified by attribute `outcome'

Read 900 cases (17 attributes) from undefined.data

Decision tree:

checking_balance in {unknown,> 200 DM}: no (412/50)
checking_balance in {1 - 200 DM,< 0 DM}:
:...credit_history in {perfect,very good}: yes (59/18)
    credit_history in {poor,critical,good}:
    :...months_loan_duration <= 22:
        :...credit_history = critical: no (72/14)
        :   credit_history = poor:
        :   :...dependents > 1: no (5)
        :   :   dependents <= 1:
        :   :   :...years_at_residence <= 3: yes (4/1)
        :   :       years_at_residence > 3: no (5/1)
        :   credit_history = good:
        :   :...savings_balance in {500 - 1000 DM,> 1000 DM}: no (15/1)
        :       savings_balance = 100 - 500 DM:
        :       :...other_credit in {none,store}: no (9/2)
        :       :   other_credit = bank: yes (3)
        :       savings_balance = unknown:
        :       :...other_credit in {none,store}: no (21/8)
        :       :   other_credit = bank: yes (1)
        :       savings_balance = < 100 DM:
        :       :...purpose in {car0,business,renovations}: no (8/2)
        :           purpose = education:
        :           :...checking_balance = 1 - 200 DM: no (1)
        :           :   checking_balance = < 0 DM: yes (4)
        :           purpose = car:
        :           :...employment_duration = unemployed: no (4/1)
        :           :   employment_duration = > 7 years: yes (5)
        :           :   employment_duration = 4 - 7 years:
        :           :   :...amount <= 1680: yes (2)
        :           :   :   amount > 1680: no (3)
        :           :   employment_duration = 1 - 4 years:
        :           :   :...years_at_residence <= 2: yes (2)
        :           :   :   years_at_residence > 2: no (6/1)
        :           :   employment_duration = < 1 year:
        :           :   :...years_at_residence <= 2: yes (5)
        :           :       years_at_residence > 2: no (3/1)
        :           purpose = furniture/appliances:
        :           :...job in {management,unskilled}: no (23/3)
        :               job = unemployed: yes (1)
        :               job = skilled:
        :               :...months_loan_duration > 13: [S1]
        :                   months_loan_duration <= 13:
        :                   :...housing in {other,own}: no (23/4)
        :                       housing = rent:
        :                       :...percent_of_income <= 3: yes (3)
        :                           percent_of_income > 3: no (2)
        months_loan_duration > 22:
        :...savings_balance = 500 - 1000 DM: yes (4/1)
            savings_balance = > 1000 DM: no (2)
            savings_balance = 100 - 500 DM:
            :...credit_history in {poor,critical}: no (14/3)
            :   credit_history = good:
            :   :...other_credit in {none,store}: yes (12/2)
            :       other_credit = bank: no (1)
            savings_balance = unknown:
            :...checking_balance = 1 - 200 DM: no (17)
            :   checking_balance = < 0 DM:
            :   :...credit_history = critical: no (1)
            :       credit_history in {poor,good}: yes (12/3)
            savings_balance = < 100 DM:
            :...months_loan_duration > 47: yes (21/2)
                months_loan_duration <= 47:
                :...housing = other:
                    :...percent_of_income <= 2: no (6)
                    :   percent_of_income > 2: yes (9/3)
                    housing = rent:
                    :...other_credit in {none,store}: yes (16/3)
                    :   other_credit = bank: no (1)
                    housing = own:
                    :...employment_duration = > 7 years: no (13/4)
                        employment_duration = unemployed:
                        :...years_at_residence <= 2: yes (4)
                        :   years_at_residence > 2: no (3)
                        employment_duration = 4 - 7 years:
                        :...job in {management,skilled,
                        :   :       unemployed}: yes (9/1)
                        :   job = unskilled: no (1)
                        employment_duration = 1 - 4 years:
                        :...purpose in {car0,business,education}: yes (7/1)
                        :   purpose in {furniture/appliances,
                        :   :           renovations}: no (7)
                        :   purpose = car:
                        :   :...years_at_residence <= 3: yes (3)
                        :       years_at_residence > 3: no (3)
                        employment_duration = < 1 year:
                        :...years_at_residence > 3: yes (5)
                            years_at_residence <= 3:
                            :...other_credit = bank: no (0)
                                other_credit = store: yes (1)
                                other_credit = none:
                                :...checking_balance = 1 - 200 DM: no (8/2)
                                    checking_balance = < 0 DM:
                                    :...job in {management,skilled,
                                        :       unemployed}: yes (2)
                                        job = unskilled: no (3/1)

SubTree [S1]

employment_duration in {unemployed,> 7 years,1 - 4 years}: yes (10)
employment_duration in {4 - 7 years,< 1 year}: no (4)


Evaluation on training data (900 cases):

	    Decision Tree   
	  ----------------  
	  Size      Errors  

	    56  133(14.8%)   <<


	   (a)   (b)    <-classified as
	  ----  ----
	   598    35    (a): class no
	    98   169    (b): class yes


	Attribute usage:

	100.00%	checking_balance
	 54.22%	credit_history
	 47.67%	months_loan_duration
	 38.11%	savings_balance
	 14.33%	purpose
	 14.33%	housing
	 12.56%	employment_duration
	  9.00%	job
	  8.67%	other_credit
	  6.33%	years_at_residence
	  2.22%	percent_of_income
	  1.56%	dependents
	  0.56%	amount


Time: 0.0 secs


> credit_pred<-predict(credit_model,credit_test)
> library(gmodels)
> CrossTable(credit_test$default,credit_pred,prop.chisq = FALSE,prop.c=FALSE,prop.r=FALSE,dnn=c('actual','predicted'))

 
   Cell Contents
|-------------------------|
|                       N |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  100 

 
             | predicted 
      actual |        no |       yes | Row Total | 
-------------|-----------|-----------|-----------|
          no |        59 |         8 |        67 | 
             |     0.590 |     0.080 |           | 
-------------|-----------|-----------|-----------|
         yes |        19 |        14 |        33 | 
             |     0.190 |     0.140 |           | 
-------------|-----------|-----------|-----------|
Column Total |        78 |        22 |       100 | 
-------------|-----------|-----------|-----------|

 
