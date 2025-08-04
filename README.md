# Diabetes Insights: Building Predictive Models for Diabetes Status With Python

![image](https://github.com/user-attachments/assets/5e774aa4-2c9f-4e89-9eb4-29bfaf91fa0c)


## Introduction
Diabetes is a growing global health issue characterized by elevated blood sugar levels, leading to serious complications if unmanaged. Early prediction is essential for effective intervention and prevention. This project focuses on developing predictive models to determine an individual's diabetes status using health-related data. By applying machine learning models such as Logistic Regression, Support Vector Machine (SVM), K-Nearest Neighbors (KNN), Decision Tree, Random Forest, XGBoost, LightGBM, Multilayer Perceptron (MLP) using Python libraries (Scikit-learn, TensorFlow, Keras) to the diabetes dataset, the goal is to identify key risk factors and create accurate tools that can help healthcare professionals identify high-risk individuals for timely treatment.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Analysis](#analysis)
- [Machine Learning Models](#machine-learning-models)
- [Results](#results)


## Features
### Numeric features
There are 13 numeric features:
- Age
- BMI (Body Mass Index): A measure calculated from a person’s weight and height to assess if they are underweight, normal weight, overweight, or obese
- SBP (Systolic Blood Pressure): The pressure in the arteries when the heart beats, indicating how much force the blood exerts on artery walls during contraction
- DBP (Diastolic Blood Pressure): The pressure in the arteries when the heart is at rest between beats, reflecting the resistance in the blood vessels
- FPG (Fasting Plasma Glucose): A blood test that measures glucose levels after at least 8 hours of fasting, used to diagnose diabetes and prediabetes
- FFPG (Final Fasting Plasma Glucose): The last recorded fasting glucose measurement in a monitoring period, used to assess long-term blood sugar control
- Cholesterol: A fatty substance found in the blood that is essential for building cells but can increase the risk of heart disease when levels are too high
- Triglyceride: A type of fat found in the blood that stores excess energy from the diet and, when elevated, can raise the risk of heart disease
- HDL (High-Density Lipoprotein): Often called "good" cholesterol, it helps remove excess cholesterol from the bloodstream, reducing the risk of heart disease
- LDL (Low-Density Lipoprotein): Known as "bad" cholesterol, it can build up in the walls of arteries and increase the risk of heart disease and stroke
- ALT (Alanine Aminotransferase): An enzyme found mainly in the liver, elevated levels of which can indicate liver damage or disease
- BUN (Blood Urea Nitrogen): A measure of the amount of nitrogen in the blood that comes from urea, used to assess kidney function and hydration status
- CCR (Creatinine Clearance): A test that estimates how well the kidneys are filtering creatinine from the blood, used to assess overall kidney function

### Categorical features
There are 4 categorical features:
- Gender: A binary variable indicating sex assigned at birth, where 0 = Male and 1 = Female
- Smoking Status: A categorical indicator of a person’s tobacco use history, where 1 = Current Smoker, 2 = Ever Smoker, and 3 = Never Smoker
- Drinking Status: A categorical variable representing alcohol consumption history, where 1 = Current Drinker, 2 = Ever Drinker, and 3 = Never Drinker
- Family History of Diabetes: A binary variable indicating whether a person has a family history of diabetes, where 1 = Yes and 0 = No

### Response variable: Diabetes
A binary outcome variable indicating the presence of diabetes, where 0 = No and 1 = Yes


## Analysis
Before building predictive models, performing exploratory data analysis (EDA) is essential to get a good grasp of different features in the dataset.

### Response variable: diabetes
With 4,299 observations in the data, there are 2,998 people without diabetes and 1,301 people with diabetes.
![image](https://github.com/alicelinh/diabetes-prediction/blob/main/diabetes%20distribution.png?raw=true)

### Association between the response variable and numeric variables
After analysing the relationships between the response variable and each numeric variable, the following conclusions were drawn:
- Age: There is a noticeable difference in the age distribution between people with and without diabetes. People with diabetes tend to be older, with their age distribution skewed higher than those without diabetes.
- FPG (Fasting Plasma Glucose) & FFPG (Final Fasting Plasma Glucose): These features also show significant differences. The FPG and FFPG values are generally higher in people with diabetes compared to those without.
- HDL (High-Density Lipoprotein) & LDL (Low-Density Lipoprotein): The interquartile ranges for both HDL and LDL are much wider in people with diabetes than in those without, indicating greater variability in these lipid levels among the diabetic group.

### Association between the response variable and categorical variables
There are no clear differences between people with and without diabetes across other categorical variables, including Gender, Smoking Status, Drinking Status, and Family History of Diabetes.

### Feature Engineering
![image](https://github.com/alicelinh/diabetes-prediction/blob/main/Screenshot%202025-08-04%20234729.png?raw=true)
Based on domain knowledge and interaction terms, I created 15 new features such as Pulse Pressure and Obesity Class. These features help to capture underlying health conditions and risk factors more effectively.

### Feature Selection
I applied a combination of filter methods (SelectKBest, Variance Threshold, Correlation Filter), wrapper methods (RFE, SFS), and embedded methods (Lasso, tree-based feature importance) to select the optimal features for each model. The most consistently selected features across methods were Age, BMI, SBP, DBP, and FPG. Among the methods, SelectKBest performed the best, followed by RFE.


## Building Predictive Models
Predictive Models: Logistic Regression, Support Vector Machine (SVM), K-Nearest Neighbors (KNN), Decision Tree, Random Forest, XGBoost, LightGBM, Multilayer Perceptron (MLP)
- Firstly, the dataset was divided into training set and testing set with ratio 8:2, respectively. All the proposed models will have the same training set and testing set as other models. The training set is to build the model and determine the parameter for each model. Then, I will use the models built to test on the testing set and examine their goodness-of-fit.
- The most important metric for goodness-of-fit is recall. Other metrics are precision, ROC AUC value.
- We can see that the cost of predicting a person who has diabetes to be diagnosed as diabetes-free is extremely high because it will have a huge impact on the patient's health. Moreover, false negative can lead to a late diagnosis of diabetes, which can lead to catastrophic consequences. Therefore, when predicting whether a person has diabetes or not, recall is very important. Recall should be high while type 1 error can be tolerated.




## Results
![image]([https://github.com/user-attachments/assets/b22d8ecc-a187-4abd-8b87-7f5d03c6ff2f](https://github.com/alicelinh/diabetes-prediction/blob/main/Screenshot%202025-08-05%20003510.png?raw=true))

After Hyperparameter Tuning:
![image](https://github.com/alicelinh/diabetes-prediction/blob/main/Screenshot%202025-08-05%20003937.png?raw=true)

Based on the goodness-of-fit, I choose the **Support Vector Machine** model as the best classifier since it produces the highest recall after tuning among all models.
