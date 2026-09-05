# Titanic Data Cleaning, Preprocessing & EDA in R

A complete R data-cleaning and preliminary exploratory-data-analysis project based on the Titanic passenger dataset.

## What this project demonstrates

- Data loading and inspection
- Missing-value assessment and treatment
- Duplicate detection
- IQR outlier detection
- Fare winsorization/capping
- Feature engineering
- Categorical/factor encoding
- One-hot encoding
- Min-Max normalization
- Z-score standardization
- Descriptive and survival-rate analysis
- Correlation analysis
- Data visualization
- Cleaned-data export

## Dataset

Original dataset: 891 rows × 12 columns.

Columns:
`PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Embarked`

The accompanying report identifies the source as:
https://github.com/datasciencedojo/datasets

Put the CSV here:

```text
data/titanic.csv
```

## Repository Structure

```text
Titanic-Data-Cleaning-R/
├── README.md
├── GITHUB_UPLOAD_GUIDE.md
├── Titanic_Data_Cleaning.R
├── data/
│   └── titanic.csv
├── outputs/
│   └── titanic_cleaned.csv
├── plots/
│   ├── 01_missing_values.png
│   ├── 02_age_distribution.png
│   ├── 03_fare_boxplot.png
│   ├── 04_survival_by_sex.png
│   ├── 05_survival_by_class.png
│   ├── 06_correlation_heatmap.png
│   ├── 07_age_density_survival.png
│   └── 08_survival_by_familysize.png
└── report/
    └── Titanic_Data_Cleaning_and_Preliminary_Analysis_R_Report.docx
```

## Installation

Install R packages:

```r
install.packages(c("ggplot2", "dplyr", "reshape2"))
```

## Run in RStudio

Open the project folder and run:

```r
source("Titanic_Data_Cleaning.R")
```

## Run in VS Code / Terminal

```bash
Rscript Titanic_Data_Cleaning.R
```

## Output

The script creates:

- `outputs/titanic_cleaned.csv`
- PNG charts in `plots/`

## Key Findings

The accompanying report reports:

- Overall survival: 38.38%
- Female survival: 74.20%
- Male survival: 18.89%
- First-class survival: 62.96%
- Second-class survival: 47.28%
- Third-class survival: 24.24%

## Report

See:

`report/Titanic_Data_Cleaning_and_Preliminary_Analysis_R_Report.docx`

## Author

**Divya Ahire**

Data Science & Analytics | R | Python | Power BI | SQL
