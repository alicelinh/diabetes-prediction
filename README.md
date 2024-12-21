# Diabetes Insights: Building Predictive Models for Diabetes Status With R

![image](https://github.com/user-attachments/assets/5e774aa4-2c9f-4e89-9eb4-29bfaf91fa0c)


## Introduction
Diabetes is a growing global health issue characterized by elevated blood sugar levels, leading to serious complications if unmanaged. Early prediction is essential for effective intervention and prevention. This project focuses on developing predictive models to determine an individual's diabetes status using health-related data. By applying machine learning models such as K-Nearest Neighbors (KNN), Decision Trees, Naive Bayes, and Logistic Regression to the dataset diabetes_dataset.csv, the goal is to identify key risk factors and create accurate tools that can help healthcare professionals identify high-risk individuals for timely treatment.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Analysis](#analysis)
- [Machine Learning Models](#machine-learning-models)
- [Results](#results)
- [Visualisation (Statistical Report)](#visualisation-statistical-report)


## Features
### Feature 1: gender
This is a categorical variable with three responses: 'Female,' 'Male,' and 'Other.' It represents the gender of each observation in the dataset.

### Feature 2: age
This is a numerical variable indicating the age of each observation in the dataset.

### Feature 3: hypertension
This is a numerical variable with two possible values: 0 and 1. A value of 0 indicates that the observation does not have hypertension, while a value of 1 indicates that the observation has hypertension.

### Feature 4: heart_disease
This is a numerical variable with two possible values: 0 and 1. A value of 0 indicates that the observation does not have heart disease, while a value of 1 indicates that the observation has heart disease.

### Feature 5: smoking_history
This is a categorial variable with six responses: "No Info," "never," "former," "current," "not current," "ever." It represents the smoking history of each observation in the dataset.

### Feature 6: bmi
This is a numerical variable indicating the Body Mass Index (BMI) of each observation in the dataset.

### Feature 7: HbA1c_level
This is a numerical variable indicating the Hemoglobin A1c (HbA1c) level of each observation in the dataset.

### Feature 8: blood_glucose_level
This is a numerical variable indicating the blood glucose level of each observation in the dataset.

### Response variable: diabetes
This is a numerical variable with two possible values: 0 and 1. A value of 0 indicates that the observation does not have diabetes, while a value of 1 indicates that the observation has diabetes.


## Analysis
Before building predictive models, performing exploratory data analysis (EDA) is essential to get a good grasp of different features in the dataset.

### Response variable: diabetes
With over 100,000 observations in the data, there are 91,500 people without diabetes and 8,500 people with diabetes.
![image](https://github.com/user-attachments/assets/abc4353b-4db3-4781-a1c4-0206830e2f6f)

### Association between the response variable and categorical variables
After analysing the relationships between the response variable and each categorical variable, the following conclusions were drawn:
- Gender: Males are more likely to have diabetes compared to females.
- Hypertension/Heart Disease: There is a strong correlation between hypertension or heart disease and diabetes, with approximately 30% of individuals with hypertension or heart disease also diagnosed with diabetes.
- Smoking History: There is no clear relationship between smoking history and diabetes status.


### Association between the response variable and numerical variables
![image](https://github.com/user-attachments/assets/80426e43-a5f5-4d0d-a938-b1fefd204034)

There is a strong positive relationship between HbA1c level and Blood Glucose level with diabetes status. Age and BMI also show a fairly strong relationship with diabetes status, though not as strong as HbA1c and Blood Glucose levels.


## Machine Learning Models
After investigating the relationships between the response variable and each feature, I chose to exclude the 'smoking_history' feature from the predictive models, as it does not show a clear association with diabetes status.
- Firstly, I divided the data set into training set and testing set with ratio 8:2, respectively. All the proposed models will have the same training set and testing set as other models. The training set is to build the model and determine the parameter for each model. Then, I will use the models built to test on the testing set and examine their goodness-of-fit.
- The metrics for goodness-of-fit I used are ROC and AUC, type 1 error (False Positive Rate), and type 2 error (False Negative Rate). 
- We can see that the cost of predicting a person who has diabetes to be diagnosed as diabetes-free is extremely high because it will have a huge impact on the patient's health. Moreover, false negative can lead to a late diagnosis of diabetes, which can lead to catastrophic consequences. Therefore, when predicting whether a person has diabetes or not, type 2 error is very important. Type 2 error should be kept low while type 1 error can be tolerated.

### Model 1: K-Nearest Neighbors (KNN)
To build the model, I employed 3-fold Cross Validation (CV) to determine the optimal value of K. Ultimately, K = 2 produced the best results, with a type 1 error of 2.26%, a type 2 error of 29.4%, and an AUC value of 0.84.

### Model 2: Decision Trees
![image](https://github.com/user-attachments/assets/50e74f54-a1ae-4dac-a896-fa4948983922)

After evaluating the model on the testing set, the results showed a type 1 error of 0%, a type 2 error of 32.9%, and an AUC value of 0.84. While the type 1 error is excellent, the type 2 error is relatively high.

### Model 3: Naive Bayes
For this model, the results were as follows: type 1 error = 1.5%, type 2 error = 36.16%, and AUC value = 0.95. Although the AUC value is very good, the type 2 error remains exceptionally high.

### Model 4: Logistic Regression
This model produces the best results, with a type 1 error of 10.2%, a type 2 error of 14.11%, and an AUC value of 0.96.

![image](https://github.com/user-attachments/assets/b22d8ecc-a187-4abd-8b87-7f5d03c6ff2f)


## Results
Based on the goodness-of-fit, I choose the **Logistic Regression** model as the best classifier since it produces the lowest type 2 error and the highest AUC value among all models.

Moreover, we can see that people with hypertension, heart disease, older age, high BMI, high Hemoglobin A1c and blood glucose level are more likely to have diabetes. Hence, it is crucial to adopt a healthy lifestyle to prevent diabetes by maintaining a balanced diet rich in whole grains, fruits, and vegetables, engaging in regular physical activity to manage weight, monitoring and controlling blood pressure and blood glucose levels, reducing intake of processed and sugary foods, and scheduling regular medical check-ups to track key health indicators. Additionally, managing stress and ensuring adequate sleep can further support overall health and reduce the risk of developing diabetes.

## Visualisation (Statistical Report)
A statistical report about the project is available to explore more about the data insights and machine learning models: [Diabetes Prediction - Statistical Report](Diabetes%20Prediction%20-%20Statistical%20Report.pdf)
