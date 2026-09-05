# 🚢 Titanic Data Cleaning, Preprocessing & Advanced EDA in R

![R](https://img.shields.io/badge/R-4.x-276DC3?style=for-the-badge&logo=r&logoColor=white)
![RStudio](https://img.shields.io/badge/RStudio-IDE-75AADB?style=for-the-badge&logo=rstudio)
![Data Analysis](https://img.shields.io/badge/Data%20Analysis-EDA-orange?style=for-the-badge)
![Data Cleaning](https://img.shields.io/badge/Data%20Cleaning-Advanced-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

> **An end-to-end R data analytics project for transforming raw Titanic passenger data into a clean, validated, feature-engineered, and analysis-ready dataset.**

---

## 📌 Project Overview

This project demonstrates a complete **data cleaning, preprocessing, feature engineering, exploratory data analysis (EDA), statistical analysis, and visualization workflow using R**.

The project starts with the raw Titanic passenger dataset and applies multiple data-preprocessing techniques before performing exploratory analysis.

### Complete Workflow

```text
Raw Titanic Dataset
        │
        ▼
Data Loading
        │
        ▼
Data Inspection
        │
        ▼
Data Quality Assessment
        │
        ├── Missing Value Analysis
        ├── Duplicate Detection
        ├── Data Type Inspection
        └── Outlier Detection
        │
        ▼
Data Cleaning
        │
        ├── Missing Value Treatment
        ├── Duplicate Removal
        └── Data Validation
        │
        ▼
Outlier Treatment
        │
        └── IQR + Fare Capping
        │
        ▼
Feature Engineering
        │
        ├── Title
        ├── FamilySize
        ├── IsAlone
        └── AgeGroup
        │
        ▼
Data Transformation
        │
        ├── Factor Encoding
        ├── Binary Encoding
        ├── One-Hot Encoding
        ├── Min-Max Normalization
        └── Z-Score Standardization
        │
        ▼
Exploratory Data Analysis
        │
        ├── Descriptive Statistics
        ├── Survival Analysis
        ├── Correlation Analysis
        └── Visualization
        │
        ▼
Final Clean Dataset
        │
        ├── CSV Output
        ├── PNG Visualizations
        └── DOCX Report

# 🎯 Project Objectives

The project focuses on the following objectives:

- Load the Titanic dataset
- Inspect the dataset structure
- Understand variables and data types
- Perform data-quality assessment
- Identify missing values
- Calculate missing-value percentages
- Treat missing observations
- Detect duplicate records
- Detect numerical outliers
- Apply appropriate outlier treatment
- Engineer meaningful features
- Encode categorical variables
- Perform binary encoding
- Perform one-hot encoding
- Apply Min-Max normalization
- Apply Z-score standardization
- Perform descriptive statistical analysis
- Analyze survival patterns
- Calculate correlations
- Generate data visualizations
- Export the cleaned dataset
- Generate reproducible outputs
- Document the complete analytical process

---

# 🧠 Problem Statement

Raw datasets often contain data-quality issues that can negatively affect analysis and machine-learning models.

Typical problems include:

```text
Missing Values
      ↓
Duplicate Records
      ↓
Outliers
      ↓
Categorical Variables
      ↓
Inconsistent Data Types
      ↓
Unscaled Numerical Features
      ↓
Poor Data Quality

# 🏗️ End-to-End Project Architecture

                     ┌─────────────────────────┐
                     │   Raw Titanic Dataset   │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │     Data Ingestion      │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │    Data Profiling       │
                     │                         │
                     │ • Structure             │
                     │ • Data Types            │
                     │ • Summary Statistics    │
                     │ • Missing Values        │
                     │ • Duplicates            │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │     Data Cleaning       │
                     │                         │
                     │ • Missing Value         │
                     │   Treatment             │
                     │ • Duplicate Handling    │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │   Outlier Processing    │
                     │                         │
                     │ • IQR Detection         │
                     │ • Percentile Capping    │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │   Feature Engineering   │
                     │                         │
                     │ • Title                 │
                     │ • FamilySize            │
                     │ • IsAlone               │
                     │ • AgeGroup              │
                     │ • CabinKnown            │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │ Encoding & Transformation│
                     │                         │
                     │ • Factor Encoding       │
                     │ • Binary Encoding       │
                     │ • One-Hot Encoding      │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │     Feature Scaling     │
                     │                         │
                     │ • Min-Max               │
                     │ • Z-Score               │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │       Advanced EDA      │
                     │                         │
                     │ • Statistics            │
                     │ • Survival Analysis     │
                     │ • Correlation           │
                     │ • Visualization         │
                     └────────────┬────────────┘
                                  │
                                  ▼
                     ┌─────────────────────────┐
                     │      Final Outputs      │
                     │                         │
                     │ • Clean CSV             │
                     │ • PNG Visualizations    │
                     │ • DOCX Report           │
                     └─────────────────────────┘

📊 Dataset

The project uses the Titanic passenger dataset.

Dataset Profile
Attribute	Value
Records	891
Original Features	12
Target	Survived
Data Type	Tabular
Domain	Transportation / Historical Passenger Data
Analysis	Data Cleaning + EDA
Original Variables
PassengerId
Survived
Pclass
Name
Sex
Age
SibSp
Parch
Ticket
Fare
Cabin
Embarked
🔎 Advanced Data Profiling

Before modifying the dataset, the project performs an initial quality assessment.

The profiling stage examines:

Number of rows
Number of columns
Variable names
Data types
Summary statistics
Missing values
Missing-value percentages
Duplicate records
Numerical distributions
Potential outliers
Categorical variables

Example:

dim(data)
str(data)
summary(data)
colSums(is.na(data))

This creates a baseline before preprocessing begins.

🚨 Data Quality Report

Initial missing-value analysis:

Variable	Missing	Percentage
Age	177	19.87%
Cabin	687	77.10%
Embarked	2	0.22%
Data Quality Strategy
Missing Data
     │
     ├── Low Missingness ──→ Imputation
     │
     ├── Moderate Missingness ──→ Statistical Imputation
     │
     └── Very High Missingness ──→ Feature Extraction / Removal
🧹 Advanced Missing-Value Treatment
Age

Instead of using only the global median, missing ages are estimated using passenger characteristics such as:

Pclass + Sex

This provides a more structured imputation strategy.

Embarked

Only two values are missing.

The mode is used for replacement.

Cabin

Because Cabin contains a very high percentage of missing observations, the project extracts a useful indicator:

CabinKnown

This preserves information about whether cabin information was available.

🔁 Duplicate Detection

Duplicate records are checked before analysis.

sum(duplicated(data))

If duplicate observations exist, they are removed to avoid bias in statistical calculations.

📈 Advanced Outlier Detection

Outliers are detected using the Interquartile Range method.

Formula
IQR = Q3 - Q1

Lower Bound = Q1 - 1.5 × IQR

Upper Bound = Q3 + 1.5 × IQR

Analyzed variables:

Age
Fare
SibSp
Parch

The analysis identifies potential extreme observations, particularly in Fare.

💰 Robust Outlier Treatment

Instead of automatically deleting extreme observations, Fare values are treated using percentile capping.

The upper threshold is based on the 99th percentile.

This approach:

Retains observations
Reduces extreme-value influence
Prevents unnecessary data loss
Maintains dataset size
🧬 Feature Engineering

Feature engineering converts existing information into more useful analytical variables.

FamilySize
FamilySize = SibSp + Parch + 1
IsAlone
1 → Passenger travelled alone
0 → Passenger travelled with family
Title Extraction

Passenger names are processed to extract titles such as:

Mr
Mrs
Miss
Master
Rare Titles
AgeGroup

Passengers are categorized into age groups to simplify demographic analysis.

Example:

Child
Young Adult
Adult
Senior
🔢 Advanced Categorical Encoding

The project demonstrates several encoding techniques.

Factor Encoding
data$Sex <- as.factor(data$Sex)
Binary Encoding
female → 0
male   → 1

Feature:

Sex_male
One-Hot Encoding

Embarkation categories are converted into dummy variables:

Embarked_C
Embarked_Q
Embarked_S
📏 Feature Scaling

Two different numerical scaling methods are demonstrated.

Min-Max Normalization
X' = (X - Xmin) / (Xmax - Xmin)

Generated features:

Age_norm
Fare_norm
Z-Score Standardization
Z = (X - μ) / σ

Generated features:

Age_z
Fare_z

This provides standardized features suitable for many statistical and machine-learning algorithms.

📊 Exploratory Data Analysis

The project investigates relationships between passenger characteristics and survival.

Major analysis areas
Survival Distribution
       │
       ├── Gender
       ├── Passenger Class
       ├── Age
       ├── Family Size
       ├── Fare
       └── Embarkation
📌 Key Findings
Overall Survival
38.38%
Survival by Gender
Gender	Survival
Female	74.20%
Male	18.89%
Survival by Class
Class	Survival
First	62.96%
Second	47.28%
Third	24.24%

These results indicate substantial differences in survival across passenger characteristics.

🔗 Correlation Analysis

A correlation matrix is created for relevant numerical and encoded variables.

Variables include:

Survived
Pclass
Age
SibSp
Parch
Fare
FamilySize
IsAlone
Sex_male

The selected analysis identifies Sex_male as having the strongest relationship with Survived among the analyzed numerical/encoded variables, with correlation approximately:

r ≈ 0.543

Important: Correlation indicates association, not causation.

📊 Visualization Layer

The project automatically creates analytical charts.

01_missing_values.png
02_age_distribution.png
03_fare_boxplot.png
04_survival_by_sex.png
05_survival_by_class.png
06_correlation_heatmap.png
07_age_density_survival.png
08_survival_by_familysize.png
Visualization Objectives
Visualization	Purpose
Missing Values	Data-quality assessment
Age Distribution	Understand passenger demographics
Fare Boxplot	Identify extreme values
Survival by Sex	Compare survival rates
Survival by Class	Analyze socioeconomic relationship
Correlation Heatmap	Identify numerical relationships
Age Density	Compare age distributions
Family Size	Analyze family-related survival patterns
🧪 Data Validation

The project can validate the processed dataset by checking:

✔ Remaining missing values
✔ Dataset dimensions
✔ Data types
✔ Duplicate records
✔ Numeric transformations
✔ Encoded variables
✔ Output file generation

Example checks:

sum(is.na(data))
sum(duplicated(data))
dim(data)
str(data)
📤 Automated Output Generation

The R script automatically creates:

outputs/
plots/

and saves:

outputs/titanic_cleaned.csv

This makes the workflow reproducible without manually exporting every result.

📁 Repository Structure
Titanic-Data-Cleaning-R/
│
├── README.md
├── GITHUB_UPLOAD_GUIDE.md
│
├── Titanic_Data_Cleaning.R
│
├── data/
│   ├── titanic.csv
│   └── README.md
│
├── outputs/
│   └── titanic_cleaned.csv
│
├── plots/
│   ├── 01_missing_values.png
│   ├── 02_age_distribution.png
│   ├── 03_fare_boxplot.png
│   ├── 04_survival_by_sex.png
│   ├── 05_survival_by_class.png
│   ├── 06_correlation_heatmap.png
│   ├── 07_age_density_survival.png
│   └── 08_survival_by_familysize.png
│
└── report/
    └── Titanic_Data_Cleaning_and_Preliminary_Analysis_R_Report.docx
🛠️ Technology Stack
Programming
R
Environment
RStudio
VS Code
Rscript
Libraries
ggplot2
dplyr
reshape2
Main Uses
Technology	Usage
R	Data analysis
dplyr	Data manipulation
ggplot2	Visualization
reshape2	Data transformation
RStudio	Development
VS Code	Alternative development environment
⚙️ Installation

Install the required packages:

install.packages(c(
  "ggplot2",
  "dplyr",
  "reshape2"
))

Load them:

library(ggplot2)
library(dplyr)
library(reshape2)
▶️ Run the Project
RStudio

Place the dataset here:

data/titanic.csv

Then execute:

source("Titanic_Data_Cleaning.R")
VS Code / Terminal

Navigate to the repository:

cd "E:\Yuva Intern\R_Data_Cleaning"

Run:

Rscript Titanic_Data_Cleaning.R
🔄 Reproducible Pipeline

The project follows a repeatable process:

Input CSV
   ↓
Run R Script
   ↓
Clean Dataset
   ↓
Feature Engineering
   ↓
Scaling
   ↓
EDA
   ↓
Charts
   ↓
Clean CSV

A user can replace the input dataset and rerun the pipeline after adapting the column-specific processing logic.

📈 Project Maturity

This project demonstrates several levels of analytics capability:

Level 1 — Data Handling
✔ Data Loading
✔ Data Inspection
✔ Data Types
Level 2 — Data Cleaning
✔ Missing Values
✔ Duplicates
✔ Outliers
Level 3 — Data Transformation
✔ Feature Engineering
✔ Encoding
✔ Normalization
✔ Standardization
Level 4 — Analytics
✔ Descriptive Statistics
✔ Survival Analysis
✔ Correlation Analysis
✔ EDA
Level 5 — Data Communication
✔ Charts
✔ Findings
✔ Analytical Report
✔ Exported Dataset
🚀 Advanced Future Enhancements

The project can be extended into a complete machine-learning pipeline.

Machine Learning

Potential models:

Logistic Regression
Decision Tree
Random Forest
Support Vector Machine
K-Nearest Neighbors
Gradient Boosting
Model Evaluation

Add:

Accuracy
Precision
Recall
F1-Score
ROC-AUC
Confusion Matrix
Cross-Validation
Advanced Feature Selection

Future versions can include:

Correlation-based Selection
Recursive Feature Elimination
Feature Importance
Permutation Importance
Interactive Analytics

The project could be extended using:

Shiny
Plotly
DT
R Markdown
Quarto

to create an interactive Titanic analytics dashboard.

🔐 Data & Privacy

This project uses a public Titanic dataset and does not process private user information.

For real-world projects, sensitive data should be handled according to organizational security and privacy requirements.

⚠️ Limitations

This project focuses on data cleaning and preliminary analysis.

It does not currently represent a production-grade machine-learning deployment.

Some preprocessing decisions are dataset-specific and should be reconsidered when applying the pipeline to a different dataset.

Correlation analysis should not be interpreted as evidence of causation.

📚 Learning Outcomes

This project provides practical experience with:

R Programming
Data Cleaning
Data Quality Assessment
Missing Value Treatment
Outlier Detection
Outlier Treatment
Feature Engineering
Categorical Encoding
One-Hot Encoding
Feature Scaling
Statistical Analysis
Correlation Analysis
Exploratory Data Analysis
Data Visualization
Data Export
Report Generation
Reproducible Analytics
💼 Portfolio Value

This project demonstrates skills relevant to:

Data Analyst
Junior Data Analyst
Data Science Intern
Business Analyst
Junior Data Scientist
Analytics Intern

It demonstrates the complete journey from:

Raw Data → Clean Data → Transformed Data → Analysis → Insights → Report

📄 Project Documentation

A detailed report is available at:

report/Titanic_Data_Cleaning_and_Preliminary_Analysis_R_Report.docx

The report covers the methodology, preprocessing, analysis, visualizations, and findings.

📌 Quick Start
git clone <your-repository-url>

cd Titanic-Data-Cleaning-R

Rscript Titanic_Data_Cleaning.R

After execution:

outputs/
    └── titanic_cleaned.csv

plots/
    ├── 01_missing_values.png
    ├── 02_age_distribution.png
    ├── 03_fare_boxplot.png
    ├── 04_survival_by_sex.png
    ├── 05_survival_by_class.png
    ├── 06_correlation_heatmap.png
    ├── 07_age_density_survival.png
    └── 08_survival_by_familysize.png
⭐ Project Highlights
🚢 Titanic Dataset Analysis
🧹 Advanced Data Cleaning
🔍 Data Quality Profiling
🚨 Missing Value Analysis
📈 IQR Outlier Detection
💰 Robust Fare Capping
🧬 Feature Engineering
🔢 Multiple Encoding Techniques
📏 Min-Max Normalization
📐 Z-Score Standardization
📊 Exploratory Data Analysis
🔗 Correlation Analysis
📉 Automated Visualization
📤 Clean Dataset Export
📄 Professional Documentation
🔄 Reproducible Workflow
🚀 Ready for ML Extension
👩‍💻 Author
Divya Ahire

Data Science & Analytics | R | Python | Power BI | SQL


