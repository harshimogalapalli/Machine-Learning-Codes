wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

# examine the structure of the wbcd data frame
str(wbcd)

# drop the id feature
wbcd <- wbcd[-1]

table(wbcd$diagnosis)

   Benign Malignant 
      357       212 

wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"),
                         labels = c("Benign", "Malignant"))

round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)

# summarize three numeric features
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])

# create normalization function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# test normalization function - result should be identical
normalize(c(1, 2, 3, 4, 5))
[1] 0.00 0.25 0.50 0.75 1.00
# normalize the wbcd data
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

# confirm that normalization worked
summary(wbcd_n$area_mean)
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.0000  0.1174  0.1729  0.2169  0.2711  1.0000 
 
# create training and test data
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

# create labels for training and test data

wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

## Step 3: Training a model on the data ----

# load the "class" library
library(class)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k = 21)

## Step 4: Evaluating model performance ----

# load the "gmodels" library
library(gmodels)

# Create the cross tabulation of predicted vs. actual
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq = FALSE)
   Cell Contents
|-------------------------|
|                       N |
|           N / Row Total |
|           N / Col Total |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  100 

 
                 | wbcd_test_pred 
wbcd_test_labels |    Benign | Malignant | Row Total | 
-----------------|-----------|-----------|-----------|
          Benign |        61 |         0 |        61 | 
                 |     1.000 |     0.000 |     0.610 | 
                 |     0.968 |     0.000 |           | 
                 |     0.610 |     0.000 |           | 
-----------------|-----------|-----------|-----------|
       Malignant |         2 |        37 |        39 | 
                 |     0.051 |     0.949 |     0.390 | 
                 |     0.032 |     1.000 |           | 
                 |     0.020 |     0.370 |           | 
-----------------|-----------|-----------|-----------|
    Column Total |        63 |        37 |       100 | 
                 |     0.630 |     0.370 |           | 
-----------------|-----------|-----------|-----------|
## Step 5: Improving model performance ----
wbcd_z <- as.data.frame(scale(wbcd[-1]))

summary(wbcd_z$area_mean)

wbcd_train <- wbcd_z[1:469, ]
wbcd_test <- wbcd_z[470:569, ]

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k = 21)

CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq = FALSE)

   Cell Contents
|-------------------------|
|                       N |
|           N / Row Total |
|           N / Col Total |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  100 

 
                 | wbcd_test_pred 
wbcd_test_labels |    Benign | Malignant | Row Total | 
-----------------|-----------|-----------|-----------|
          Benign |        61 |         0 |        61 | 
                 |     1.000 |     0.000 |     0.610 | 
                 |     0.924 |     0.000 |           | 
                 |     0.610 |     0.000 |           | 
-----------------|-----------|-----------|-----------|
       Malignant |         5 |        34 |        39 | 
                 |     0.128 |     0.872 |     0.390 | 
                 |     0.076 |     1.000 |           | 
                 |     0.050 |     0.340 |           | 
-----------------|-----------|-----------|-----------|
    Column Total |        66 |        34 |       100 | 
                 |     0.660 |     0.340 |           | 
-----------------|-----------|-----------|-----------|
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=1)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

   Cell Contents
|-------------------------|
|                       N |
|           N / Row Total |
|           N / Col Total |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  100 

 
                 | wbcd_test_pred 
wbcd_test_labels |    Benign | Malignant | Row Total | 
-----------------|-----------|-----------|-----------|
          Benign |        58 |         3 |        61 | 
                 |     0.951 |     0.049 |     0.610 | 
                 |     0.983 |     0.073 |           | 
                 |     0.580 |     0.030 |           | 
-----------------|-----------|-----------|-----------|
       Malignant |         1 |        38 |        39 | 
                 |     0.026 |     0.974 |     0.390 | 
                 |     0.017 |     0.927 |           | 
                 |     0.010 |     0.380 |           | 
-----------------|-----------|-----------|-----------|
    Column Total |        59 |        41 |       100 | 
                 |     0.590 |     0.410 |           | 
-----------------|-----------|-----------|-----------|
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=5)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

  Cell Contents
|-------------------------|
|                       N |
|           N / Row Total |
|           N / Col Total |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  100 

 
                 | wbcd_test_pred 
wbcd_test_labels |    Benign | Malignant | Row Total | 
-----------------|-----------|-----------|-----------|
          Benign |        61 |         0 |        61 | 
                 |     1.000 |     0.000 |     0.610 | 
                 |     0.968 |     0.000 |           | 
                 |     0.610 |     0.000 |           | 
-----------------|-----------|-----------|-----------|
       Malignant |         2 |        37 |        39 | 
                 |     0.051 |     0.949 |     0.390 | 
                 |     0.032 |     1.000 |           | 
                 |     0.020 |     0.370 |           | 
-----------------|-----------|-----------|-----------|
    Column Total |        63 |        37 |       100 | 
                 |     0.630 |     0.370 |           | 
-----------------|-----------|-----------|-----------|

 
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=11)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

   Cell Contents
|-------------------------|
|                       N |
|           N / Row Total |
|           N / Col Total |
|         N / Table Total |
|-------------------------|

 
Total Observations in Table:  100 

 
                 | wbcd_test_pred 
wbcd_test_labels |    Benign | Malignant | Row Total | 
-----------------|-----------|-----------|-----------|
          Benign |        61 |         0 |        61 | 
                 |     1.000 |     0.000 |     0.610 | 
                 |     0.953 |     0.000 |           | 
                 |     0.610 |     0.000 |           | 
-----------------|-----------|-----------|-----------|
       Malignant |         3 |        36 |        39 | 
                 |     0.077 |     0.923 |     0.390 | 
                 |     0.047 |     1.000 |           | 
                 |     0.030 |     0.360 |           | 
-----------------|-----------|-----------|-----------|
    Column Total |        64 |        36 |       100 | 
                 |     0.640 |     0.360 |           | 
-----------------|-----------|-----------|-----------|

 
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=15)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=21)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = wbcd_train_labels, k=27)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)
