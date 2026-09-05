# GitHub Upload Guide

## 1. Create a repository

Create a new GitHub repository named:

`Titanic-Data-Cleaning-R`

## 2. Add the dataset

Put the Titanic CSV into:

`data/titanic.csv`

## 3. Run the project

From RStudio:

```r
source("Titanic_Data_Cleaning.R")
```

Or terminal:

```bash
Rscript Titanic_Data_Cleaning.R
```

## 4. Push with Git

```bash
git init
git add .
git commit -m "Add Titanic R data cleaning and EDA project"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/Titanic-Data-Cleaning-R.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username.
