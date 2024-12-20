set.seed(1101)

data = read.csv("D:\\diabetes_dataset.csv")
head(data)
data$hypertension = as.factor(data$hypertension)
data$heart_disease = as.factor(data$heart_disease)
data$diabetes = as.factor(data$diabetes)
attach(data)

# Part I. Exploring the data set
# 1. Summarize the response variable and each input variable

# Response variable: diabetes
table(diabetes)
barplot(table(diabetes), xlab = "Status of diabetes", ylab = "Number of people", col = "pink", ylim = c(0, 90000))
# There are 91500 people without diabetes and 8500 people with diabetes


# Input variable 1: gender
table(gender)
# There are 58552 females, 41430 males and 18 others
# The number of females = 1.4 times the number of males


# Input variable 2: age
summary(age)
# The smallest age is 0.08 years old
# The oldest age is 80 years old
# The median age is 43 years old
# The mean age is 41.89 years old
range(age) # [1]  0.08 80.00
var(age) # [1] 507.0081
sd(age) # [1] 22.51684
IQR(age) # [1] 36
hist(age, freq = FALSE, xlim = c(-10, 90))
lines(density(age), col = "red")
# The data "age" seems to cluster together, symmetric, multimodal
# There are no suspected outliers
boxplot(age, col = "blue", xlab = "Boxplot of age", ylab = "Age")
# There are no outliers
qqnorm(age, pch = 20)
qqline(age, col = "red")
# The data "age" does not follow normal distribution
# Both the right tail and the left tail are shorter than normal


# Input variable 3: hypertension
table(hypertension)
# There are 92515 people without hypertension and 7485 people with hypertension
# The number of people without hypertension is much larger than that of people with hypertension
# Only 7.485% of people in the data set have hypertension
barplot(table(hypertension))


# Input variable 4: heart_disease
table(heart_disease)
# There are 96058 people without heart disease and 3942 people with heart disease
# The number of people without heart disease is much larger than that of people with heart disease
# Only 3.942% of people in the data set have heart disease


# Input variable 5: smoking_history
table(smoking_history)
# smoking_history
# current        ever      former       never     No Info not current 
#    9286        4004        9352       35095       35816        6447 
# Around 35% of people in the data set have never smoked
# Around 9.3% of people in the data set are smoking currently


# Input variable 6: bmi
summary(bmi)
# The smallest BMI is 10.01
# The largest BMI is 95.69
# The median BMI is 27.32
# The mean BMI is 27.32, equal to the median
range(bmi) # [1] 10.01 95.69
var(bmi) # [1] 44.04689
sd(bmi) # [1] 6.636783
IQR(bmi) # [1] 5.95
hist(bmi, freq = FALSE, ylim = c(0, 0.15))
lines(density(bmi), col = "red")
# The data "bmi" seems to cluster together
# The data "bmi" is unimodal, a bit right-skewed
# There are no suspected outliers
boxplot(bmi, col = "blue")
# There are many large outliers and some small outliers
outlier <- boxplot(bmi)$out
length(outlier)
# There are a total of 7086 outliers
large.outlier <- which(outlier > 27.32)
length(large.outlier)
# There are 6965 large outliers
qqnorm(bmi, pch = 20)
qqline(bmi, col = "red")
# The data "bmi" does not follow normal distribution
# The right tail is much longer than normal


# Input variable 7: HbA1c_level
summary(HbA1c_level)
# The smallest HbA1c_level is 3.500
# The highest HbA1c_level is 9.000
# The median HbA1c_level is 5.800
# The mean HbA1c_level is 5.528
range(HbA1c_level) # [1] 3.5 9.0
var(HbA1c_level) # [1] 1.146339
sd(HbA1c_level) # [1] 1.070672
IQR(HbA1c_level) # [1] 1.4
hist(HbA1c_level, freq = FALSE)
lines(density(HbA1c_level), col = "red")
# The data "HbA1c_level" does not cluster together. There are some gaps between the distribution
# of the data and there are also some observations deviate from the rest
# The data "HbA1c_level" is multimodal, not symmetric
# There are some large suspected outliers
boxplot(HbA1c_level, xlab = "Boxplot of HbA1c_level", ylab = "HbA1c_level")
# There are some large outliers
out <- boxplot(HbA1c_level)$out
length(out)
# There are 1315 large outliers
qqnorm(HbA1c_level, pch = 20)
qqline(HbA1c_level, col = "red")
# The data "HbA1c_level" does not follow normal distribution
# The left tail is obviously shorter than normal


# Input variable 8: blood_glucose_level
summary(blood_glucose_level)
# The smallest blood_glucose_level is 80.0
# The highest blood_glucose_level is 300.0
# The median blood_glucose_level is 140.0
# The mean blood_glucose_level is 138.1
range(blood_glucose_level) # [1] 80 300
var(blood_glucose_level) # [1] 1657.152
sd(blood_glucose_level) # [1] 40.70814
IQR(blood_glucose_level) # [1] 59
hist(blood_glucose_level, freq = FALSE)
lines(density(blood_glucose_level), col = "red")
# The data "blood_glucose_level" does not cluster together
# There are many gaps in the data and there are many observations deviate from the rest
# The data is multimodal
# The data is not symmetric, a bit right-skewed
# There are many suspected outliers
boxplot(blood_glucose_level, xlab = "Boxplot of blood_glucose_level", ylab = "blood_glucose_level", col = "blue")
# There are some large outliers
length(boxplot(blood_glucose_level)$out)
# There are 2038 large outliers
qqnorm(blood_glucose_level, pch = 20)
qqline(blood_glucose_level, col = "red")
# The data "blood_glucose_level" does not follow normal distribution
# The left tail is obviously shorter than normal




# 2. The association between the response variable and each input variable

# Association between the response and input variable 1: "gender"
# Contingency table of frequency:
table_gender <- table(gender, diabetes)
table_gender
# Contingency table of proportion by gender
prop_gender <- prop.table(table_gender, "gender")
prop_gender
# The conditional probabilities of diabetes given gender are:
#         diabetes
# gender            0          1
#   Female 0.92381131 0.07618869
#   Male   0.90251026 0.09748974
#   Other  1.00000000 0.00000000

# There is an association between gender "Male" and "Female" with the response
# It seems that Male tends to have diabetes more than Female
# All the "Other" category in this data set do not have diabetes; however, there are only
# 18 people with "Other" gender in the data set, a very small number so it does not really
# indicate any strong association between gender "Other" and the response



# Association between the response and input variable 2: age
boxplot(age ~ diabetes, col = "blue")
# There is a quite strong association between age and the response
# It seems that older people tend to have diabetes more than younger people
# The median age of people without diabetes is around 40 years old, much younger than that
# of people with diabetes which is around 60 years old
# The 2 box plots only overlap a bit
# The IQR for people without diabetes are larger than that of people with diabetes
# The range for people without diabetes are generally lower than that of people with diabetes
# In the box plot of people with diabetes, there are many small outliers



# Association between the response and input variable 3: hypertension
# Contingency table of frequency:
table_freq_hypertension <- table(hypertension, diabetes)
table_freq_hypertension
#             diabetes
# hypertension     0     1
#            0 86103  6412
#            1  5397  2088

# Contingency table of proportion by hypertension:
table_prop_hypertension <- prop.table(table_freq_hypertension, "hypertension")
table_prop_hypertension
# The conditional probabilities of diabetes given hypertension are:
#             diabetes
# hypertension          0          1
#            0 0.93069232 0.06930768
#            1 0.72104208 0.27895792

# There is a quite strong association between hypertension and the response
# It seems that people with hypertension tend to have diabetes more than people without
# hypertension
# Among all people with hypertension, 27.9% of them have diabetes, while that of people
# without hypertension only stands at 6.9%

# Odds ratio:
# For the group of people with hypertension: the odd of success (having diabetes) is:
table_prop_hypertension[2, 2]/(1 - table_prop_hypertension[2, 2]) # 0.3868816
# For the group of people without hypertension: the odd of success (having diabetes) is:
table_prop_hypertension[1, 2]/(1 - table_prop_hypertension[1, 2]) # 0.07446895
# The odds ratio is:
0.3868816/0.07446895 # 5.195207
# This means, the odd of having diabetes among people with hypertension is around 5.2 times
# the odd of having diabetes among people without hypertension
# This again shows a strong association between hypertension and the response



# Association between the response and input variable 4: heart_disease
# Contingency table of frequency:
table_freq_heart_disease <- table(heart_disease, diabetes)
table_freq_heart_disease
#              diabetes
# heart_disease     0     1
#             0 88825  7233
#             1  2675  1267

# Contingency table of proportion by heart_disease:
table_prop_heart_disease <- prop.table(table_freq_heart_disease, "heart_disease")
table_prop_heart_disease
# The conditional probabilities of diabetes given heart_disease are:
#             diabetes
# heart_disease          0          1
#             0 0.92470174 0.07529826
#             1 0.67858955 0.32141045

# There is a strong association between heart_disease and the response
# It seems that people with heart disease tend to have diabetes more than people without
# heart disease
# Among all people with heart disease, around 32% of them have diabetes while that of
# people without diabetes is only 7.5%

# Odds ratio:
# For the group of people with heart disease: the odd of success (having diabetes) is:
table_prop_heart_disease[2, 2]/(1 - table_prop_heart_disease[2, 2]) # 0.4736449
# For the group of people without heart disease: the odd of success (having diabetes) is:
table_prop_heart_disease[1, 2]/(1 - table_prop_heart_disease[1, 2]) # 0.08142978
# The odds ratio is:
0.4736449/0.08142978 # 5.816605
# This means, the odd of having diabetes among people with heart disease is around 5.8 times
# the odd of having diabetes among people without heart disease
# This again shows a strong association between heart disease and the response



# Association between the response and input variable 5: smoking_history
# Contingency table of frequency:
table_freq_smoking <- table(smoking_history, diabetes)
table_freq_smoking
# Contingency table of proportion by smoking history:
table_prop_smoking <- prop.table(table_freq_smoking, "smoking_history")
table_prop_smoking
# The conditional probabilities of diabetes given smoking history are:
#                diabetes
# smoking_history          0          1
#     current     0.89791083 0.10208917
#     ever        0.88211788 0.11788212
#     former      0.82998289 0.17001711
#     never       0.90465878 0.09534122
#     No Info     0.95940362 0.04059638
#     not current 0.89297348 0.10702652

# There is a quite weak association between smoking history and the response
# It seems that for almost smoking history except "former" and "No Info", there are around
# 10% of people in each smoking history have diabetes
# For the smoking history of "former," there are approximately 17% of people having diabetes,
# higher than that of other categories around 7%
# For the smoking history of "No Info," there are only 4% of people having diabetes



# Association between the response and input variable 6: bmi
boxplot(bmi ~ diabetes, col = "red")
# There is a quite strong association between BMI and the response because the box plots of 
# BMI of people with and without diabetes are quite different
# While the median are approximately the same (at around 27), the IQR of people not 
# having diabetes is lower than the IQR of people with diabetes
# The range of the box plot of people having diabetes is larger and higher than that of
# people without diabetes
# There are many large outliers in both of the box plots
# There are also some small outliers in both of the box plots



# Association between the response and input variable 7: HbA1c_level
boxplot(HbA1c_level ~ diabetes, col = "green")
# There is a strong association between HbA1c_level and the response
# The median HbA1c_level of people with diabetes (around 6.7) are higher than that 
# of people without diabetes (around 5.8)
# The range of people having diabetes are much higher and than the range and IQR of
# people not having diabetes
# The IQRs are approximately the same
# There are no outliers in both the box plots



# Association between the response and input variable 8: blood_glucose_level
boxplot(blood_glucose_level ~ diabetes, col = "orange")
# There is a strong association between blood_glucose_level and the response
# It seems that people with higher blood glucose level tend to have diabetes more than
# people with lower blood glucose level
# The median blood_glucose_level of people with diabetes are around 160, higher than
# that of people with diabetes which stand at around 140
# The IQR of people having diabetes are much larger than that of people not having diabetes
# The range of people with diabetes are higher than that of people without diabetes
# There are no outliers in both the box plots


# In conclusion, except the input variable "smoking_history", all other input variables,
# including "gender," "age," "hypertension," heart_disease," "bmi," "HbA1c_level," 
# "blood_glucose_level" have a quite strong association with the response variable "diabetes"

# Therefore, when forming classifier models, I will exclude the input variable
# "smoking_history" and include all other 7 input variables


# Part II. Building Model/Classifier and Conclusion

# First proposed model: KNN
# For KNN, I only choose numeric input variables which are: age, bmi, HbA1c_level, 
# blood_glucose_level

data_knn <- data[, c("age", "bmi", "HbA1c_level", "blood_glucose_level")]
data_knn$age = scale(data_knn$age)
data_knn$bmi = scale(data_knn$bmi)
data_knn$HbA1c_level = scale(data_knn$HbA1c_level)
data_knn$blood_glucose_level = scale(data_knn$blood_glucose_level)

response_knn <- data[,c("diabetes")]

n = dim(data_knn)[1]

train.index.knn <- sample(1:n)[1:(0.8 * n)]
train_data_knn <- data_knn[train.index.knn,]
test_data_knn <- data_knn[-train.index.knn,]
train_response_knn <- response_knn[train.index.knn]
test_response_knn <- response_knn[-train.index.knn]

library(class)
library(ROCR)

n_folds = 3
folds_j <- sample(rep(1:n_folds, length.out = (0.8*n)))

type1.knn <- numeric()
type2.knn <- numeric()
auc.knn <- numeric()

for (i in c(2, 5, 10, 15, 30, 50, 100, 200, 300)) {
  type1.knn.fold = 0
  type2.knn.fold = 0
  auc.knn.fold = 0
  for (j in 1:3) {
    test_j <- which(folds_j == j)
    train.data.fold <- train_data_knn[-test_j,]
    test.data.fold <- train_data_knn[test_j,]
    train.response.fold <- train_response_knn[-test_j]
    knn.pred <- knn(train.data.fold, test.data.fold, train.response.fold, k = i)
    
    confusion.matrix <- table(train_response_knn[test_j], knn.pred)
    type1.knn.fold = type1.knn.fold + (confusion.matrix[1, 2]/(confusion.matrix[1, 2] + confusion.matrix[1, 1]))
    type2.knn.fold = type2.knn.fold + (confusion.matrix[2, 1]/(confusion.matrix[2, 1] + confusion.matrix[2, 2]))
    

    knn.roc.pred <- as.numeric(paste(knn.pred))
    test.response.fold <- train_response_knn[test_j]
    curve <- prediction(knn.roc.pred, test.response.fold)
    auc.knn.fold = auc.knn.fold + performance(curve, "auc")@y.values[[1]]
  }
  type1.knn <- c(type1.knn, type1.knn.fold/3)
  type2.knn <- c(type2.knn, type2.knn.fold/3)
  auc.knn <- c(auc.knn, auc.knn.fold/3)
}

type1.knn
type2.knn
auc.knn

plot(c(2, 5, 10, 15, 30, 50, 100, 200, 300), type1.knn,xlab = "K", col = "blue", pch = 20)
plot(c(2, 5, 10, 15, 30, 50, 100, 200, 300), type2.knn,xlab = "K", col = "red", pch = 20)
plot(c(2, 5, 10, 15, 30, 50, 100, 200, 300), auc.knn,xlab = "K", col = "purple", pch = 20)

# The results:
# type1.knn: [1] 2.243438e-02 5.519402e-03 2.432409e-03 1.585192e-03 7.924466e-04 4.918698e-04 2.051221e-04 1.914961e-04
#           [9] 9.557184e-05
# type2.knn: [1] 0.3053954 0.3401034 0.3605272 0.3774479 0.3959299 0.4107538 0.4322696 0.4536414 0.4690697
# auc.knn: [1] 0.8360851 0.8271886 0.8185202 0.8104835 0.8016388 0.7943771 0.7837627 0.7730835 0.7654174

# The cost of predicting a person, who has diabetes, to be diagnosed as diabetes-free is
# extremely high because it will have a huge impact on the patient's health
# Moreover, false negative can lead to late diagnostic of diabetes, which can lead to catastrophic
# consequences

# Therefore, when predicting whether a person having diabetes or not, type 2 error is important.
# Type 2 error should be kept low while type 1 error can be tolerated

# Based on the result, I would choose k = 2 which produces the lowest type 2 error (0.305)
# and the highest AUC value (0.836). The type 1 error for k = 2 is also low, at 0.02

# Testing for the testing data:
model.knn <- knn(train_data_knn, test_data_knn, train_response_knn, k = 2)
comparison_knn <- table(test_response_knn, model.knn)
comparison_knn

type1.knn.overall <- comparison_knn[1, 2]/(comparison_knn[1, 2] + comparison_knn[1, 1])
type2.knn.overall <- comparison_knn[2, 1]/(comparison_knn[2, 1] + comparison_knn[2, 2])

prob <- knn(train_data_knn, test_data_knn, train_response_knn, k = 2, prob = TRUE)
pred.roc.knn.overall <- 1 - attr(prob, "prob")
roc.knn <- prediction(pred.roc.knn.overall, test_response_knn)
perf.knn <- performance(roc.knn, "tpr", "fpr")
auc.knn.overall <- performance(roc.knn, "auc")@y.values[[1]]
plot(perf.knn, lwd = 2, main = paste("Area under the curve:", round(auc.knn.overall,4)))
abline (a=0, b=1, col ="blue", lty =3)

alpha <- round (as.numeric(unlist(perf.knn@alpha.values)) ,4)
length(alpha) 
fpr <- round(as.numeric(unlist(perf.knn@x.values)) ,4)
tpr <- round(as.numeric(unlist(perf.knn@y.values)) ,4)

# adjust margins and plot TPR and FPR
par(mar = c(5 ,5 ,2 ,5))

plot(alpha ,tpr , xlab ="Threshold",
     ylab = "True positive rate ", type ="l", col = "blue")
par( new ="True")
plot(alpha ,fpr , xlab ="", ylab ="", axes =F, type ="l", col = "red" )
axis( side =4) # to create an axis at the 4th side
mtext(side =4, line =3, "False positive rate")
text(0.18 ,0 , "FPR")
text(0.2 ,0.18, "TPR")

type1.knn.overall
type2.knn.overall
auc.knn.overall
# Type 1 error: 0.02255229 = 2.26%
# Type 2 error: 0.294013 = 29.4%
# AUC value: 0.8417173





# Second proposed model: Decision Tree
# For Decision Tree, I choose 7 input variables: "gender," "age," "hypertension," heart_disease,"
# "bmi," "HbA1c_level," "blood_glucose_level"
# The training and testing set will be the same as other models

train.index.dt <- train.index.knn
train_data_dt <- data[train.index.dt,]
test_data_dt <- data[-train.index.dt, c("gender", "age", "hypertension", "heart_disease", "bmi", "HbA1c_level", "blood_glucose_level")]
test_data_dt_response <- data[-train.index.dt, c("diabetes")]

library(rpart)
library(rpart.plot)

model_dt <- rpart(diabetes ~ gender + age + hypertension + heart_disease + bmi + HbA1c_level + blood_glucose_level,
                  method = "class", data = train_data_dt, control = rpart.control(minsplit = 6), parms = list(split = 'information'))

rpart.plot(model_dt, type = 4, extra = 2)

dt.pred.prob <- predict(model_dt, newdata = test_data_dt, type = "prob")
dt.pred.class <- predict(model_dt, newdata = test_data_dt, type = "class")

confusion.matrix.dt <- table(test_data_dt_response, dt.pred.class)
confusion.matrix.dt

type1.dt <- confusion.matrix.dt[1, 2]/(confusion.matrix.dt[1, 2] + confusion.matrix.dt[1, 1])
type2.dt <- confusion.matrix.dt[2, 1]/(confusion.matrix.dt[2, 1] + confusion.matrix.dt[2, 2])

score_dt <- dt.pred.prob[, c("1")]
actual_class_dt <- test_data_dt_response
pred.dt <- prediction(score_dt, actual_class_dt)
perf.dt <- performance(pred.dt, "tpr", "fpr")
auc.dt <- performance(pred.dt, "auc")@y.values[[1]]
plot(perf.dt, lwd =2, main = paste("Area under the curve:", round(auc.dt, 4)))
abline(a=0, b=1, col ="blue", lty =3)


type1.dt
type2.dt
auc.dt

# Type 1 error: 0
# Type 2 error: 0.3289864 = 32.9%
# AUC value: 0.8355068






# Third proposed model: Naive Bayes
# For Naive Bayes, I choose 7 input variables: "gender," "age," "hypertension," heart_disease,"
# "bmi," "HbA1c_level," "blood_glucose_level"
# The training and testing set will be the same as other models

train.index.nb <- train.index.knn
train_data_nb <- data[train.index.nb,]
test_data_nb <- data[-train.index.nb, c("gender", "age", "hypertension", "heart_disease", "bmi", "HbA1c_level", "blood_glucose_level")]
test_data_nb_response <- data[-train.index.nb, c("diabetes")]

library(e1071)

model_nb <- naiveBayes(diabetes ~ gender + age + hypertension + heart_disease + bmi + HbA1c_level + blood_glucose_level, train_data_nb)

nb.pred.raw <- predict(model_nb, newdata = test_data_nb, type = "raw")
nb.pred.class <- predict(model_nb, newdata = test_data_nb, type = "class")

confusion.matrix.nb <- table(test_data_nb_response, nb.pred.class)
confusion.matrix.nb

type1.nb <- confusion.matrix.nb[1, 2]/(confusion.matrix.nb[1, 2] + confusion.matrix.nb[1, 1])
type2.nb <- confusion.matrix.nb[2, 1]/(confusion.matrix.nb[2, 1] + confusion.matrix.nb[2, 2])

score_nb <- nb.pred.raw[, c("1")]
actual_class_nb <- test_data_nb_response
pred.nb <- prediction(score_nb, actual_class_nb)
perf.nb <- performance(pred.nb, "tpr", "fpr")
auc.nb <- performance(pred.nb, "auc")@y.values[[1]]
plot(perf.nb, lwd =2, main = paste("Area under the curve:", round(auc.nb, 4)))
abline(a=0, b=1, col ="blue", lty =3)


type1.nb
type2.nb
auc.nb

# Type 1 error: 0.01501665 = 1.5%
# Type 2 error: 0.3615886 = 36.16%
# AUC value: 0.9515408




# Fourth proposed model: Logistic Regression
# For Logistic Regression, I choose 7 input variables: "gender," "age," "hypertension," heart_disease,"
# "bmi," "HbA1c_level," "blood_glucose_level"
# The training and testing set will be the same as other models

train.index.log <- train.index.knn
train_data_log <- data[train.index.log,]
test_data_log <- data[-train.index.log, c("gender", "age", "hypertension", "heart_disease", "bmi", "HbA1c_level", "blood_glucose_level")]
test_data_log_response <- data[-train.index.log, c("diabetes")]

model_log <- glm(diabetes ~ gender + age + hypertension + heart_disease + bmi + 
                   HbA1c_level + blood_glucose_level, data = train_data_log, 
                   family = binomial(link ="logit"))

log.pred.response <- predict(model_log, newdata = test_data_log, type = "response")

score_log <- log.pred.response
actual_class_log <- test_data_log_response
pred.log <- prediction(score_log, actual_class_log)
perf.log <- performance(pred.log, "tpr", "fpr")
auc.log <- performance(pred.log, "auc")@y.values[[1]]
plot(perf.log, lwd =2, main = paste("Area under the curve:", round(auc.log, 4)))
abline(a=0, b=1, col ="blue", lty =3)

# Visualize how the threshold changes will change TPR and FPR
threshold <- round(as.numeric(unlist(perf.log@alpha.values)) ,4)
fpr <- round(as.numeric(unlist(perf.log@x.values)) ,4)
tpr <- round(as.numeric(unlist(perf.log@y.values)) ,4)
par(mar = c(5 ,5 ,2 ,5))
plot(threshold ,tpr , xlab ="Threshold", xlim =c(0 ,1) ,
     ylab = "True positive rate ", type ="l", col = "blue")
par(new ="True")
plot(threshold ,fpr , xlab ="", ylab ="", axes =F, xlim =c(0 ,1) , type ="l", col = "red" )
axis(side =4)
mtext(side =4, line =3, "False positive rate")
text(0.4 ,0.05 , "FPR")
text(0.6 ,0.65 , "TPR")

# Choosing threshold = 0.1 will be ideal
log.pred.class <- ifelse(log.pred.response > 0.1, "1", "0")

confusion.matrix.log <- table(test_data_log_response, log.pred.class)
confusion.matrix.log

type1.log <- confusion.matrix.log[1, 2]/(confusion.matrix.log[1, 2] + confusion.matrix.log[1, 1])
type2.log <- confusion.matrix.log[2, 1]/(confusion.matrix.log[2, 1] + confusion.matrix.log[2, 2])



type1.log
type2.log
auc.log

# Type 1 error: 0.102004 = 10.2%
# Type 2 error: 0.1410788 = 14.11%
# AUC value: 0.9619871























  
  
  
  
  
  
  
  


