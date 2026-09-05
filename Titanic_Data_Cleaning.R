# TITANIC DATASET - DATA CLEANING, PREPROCESSING & EDA IN R

suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(reshape2))

dir.create("outputs", showWarnings = FALSE)
dir.create("plots", showWarnings = FALSE)

# 1. LOAD DATA
titanic <- read.csv("data/titanic.csv", stringsAsFactors = FALSE)
print(dim(titanic))
str(titanic)
print(head(titanic, 5))
print(summary(titanic))

# 2. MISSING VALUES
na_count <- sapply(titanic, function(x) sum(is.na(x) | x == ""))
pct_missing <- round(100 * na_count / nrow(titanic), 2)
print(na_count)
print(pct_missing)

missing_df <- data.frame(Variable=names(na_count), Missing=as.numeric(na_count))
missing_df <- missing_df[missing_df$Missing > 0, ]

if (nrow(missing_df) > 0) {
  p1 <- ggplot(missing_df, aes(x=reorder(Variable,-Missing), y=Missing)) +
    geom_bar(stat="identity") +
    labs(title="Missing Values by Column (Before Cleaning)",
         x="Variable", y="Missing Count") +
    theme_minimal()
  ggsave("plots/01_missing_values.png", p1, width=7, height=5, dpi=150)
}

# 3. DATA CLEANING
titanic_clean <- titanic

titanic_clean$CabinKnown <- ifelse(
  titanic_clean$Cabin == "" | is.na(titanic_clean$Cabin), 0, 1
)
titanic_clean$Cabin <- NULL

titanic_clean <- titanic_clean %>%
  group_by(Pclass, Sex) %>%
  mutate(Age=ifelse(is.na(Age), median(Age, na.rm=TRUE), Age)) %>%
  ungroup() %>%
  as.data.frame()

embarked_values <- titanic_clean$Embarked[
  titanic_clean$Embarked != "" & !is.na(titanic_clean$Embarked)
]
embarked_mode <- names(sort(table(embarked_values), decreasing=TRUE))[1]

titanic_clean$Embarked[
  titanic_clean$Embarked == "" | is.na(titanic_clean$Embarked)
] <- embarked_mode

if (any(is.na(titanic_clean$Fare))) {
  titanic_clean$Fare[is.na(titanic_clean$Fare)] <-
    median(titanic_clean$Fare, na.rm=TRUE)
}

# 4. DUPLICATES
duplicate_count <- sum(duplicated(titanic_clean))
cat("Duplicate rows:", duplicate_count, "\n")
if (duplicate_count > 0)
  titanic_clean <- titanic_clean[!duplicated(titanic_clean), ]

# 5. OUTLIER DETECTION
detect_outliers <- function(x) {
  q1 <- quantile(x, .25, na.rm=TRUE)
  q3 <- quantile(x, .75, na.rm=TRUE)
  iqr <- q3-q1
  sum(x < q1-1.5*iqr | x > q3+1.5*iqr, na.rm=TRUE)
}

cat("Age outliers:", detect_outliers(titanic_clean$Age), "\n")
cat("Fare outliers:", detect_outliers(titanic_clean$Fare), "\n")
cat("SibSp outliers:", detect_outliers(titanic_clean$SibSp), "\n")
cat("Parch outliers:", detect_outliers(titanic_clean$Parch), "\n")

p3 <- ggplot(titanic_clean, aes(x="", y=Fare)) +
  geom_boxplot() +
  labs(title="Fare Distribution - Outlier Detection", x="", y="Fare") +
  theme_minimal()
ggsave("plots/03_fare_boxplot.png", p3, width=5, height=5, dpi=150)

fare_cap <- quantile(titanic_clean$Fare, .99, na.rm=TRUE)
titanic_clean$Fare_capped <- ifelse(
  titanic_clean$Fare > fare_cap, fare_cap, titanic_clean$Fare
)

# 6. FEATURE ENGINEERING
titanic_clean$Title <- gsub("(.*, )|(\\..*)", "", titanic_clean$Name)
rare_titles <- names(table(titanic_clean$Title))[table(titanic_clean$Title) < 10]
titanic_clean$Title[titanic_clean$Title %in% rare_titles] <- "Rare"

titanic_clean$FamilySize <- titanic_clean$SibSp + titanic_clean$Parch + 1
titanic_clean$IsAlone <- ifelse(titanic_clean$FamilySize == 1, 1, 0)

titanic_clean$AgeGroup <- cut(
  titanic_clean$Age,
  breaks=c(0,12,18,35,60,100),
  labels=c("Child","Teen","Young Adult","Adult","Senior")
)

# 7. CATEGORICAL ENCODING
titanic_clean$Sex <- factor(titanic_clean$Sex, levels=c("male","female"))
titanic_clean$Embarked <- factor(titanic_clean$Embarked)
titanic_clean$Pclass <- factor(
  titanic_clean$Pclass, levels=c(1,2,3), ordered=TRUE
)

titanic_clean$Sex_male <- ifelse(titanic_clean$Sex=="male", 1, 0)

embarked_dummies <- model.matrix(~ Embarked - 1, data=titanic_clean)
colnames(embarked_dummies) <- gsub("Embarked", "Embarked_", colnames(embarked_dummies))
titanic_clean <- cbind(titanic_clean, embarked_dummies)

# 8. NORMALIZATION / STANDARDIZATION
min_max_scale <- function(x)
  (x-min(x,na.rm=TRUE))/(max(x,na.rm=TRUE)-min(x,na.rm=TRUE))

titanic_clean$Age_norm <- min_max_scale(titanic_clean$Age)
titanic_clean$Fare_norm <- min_max_scale(titanic_clean$Fare_capped)
titanic_clean$Age_z <- as.numeric(scale(titanic_clean$Age))
titanic_clean$Fare_z <- as.numeric(scale(titanic_clean$Fare_capped))

# 9. EDA
titanic_clean$SurvivedLabel <- factor(
  titanic_clean$Survived, levels=c(0,1), labels=c("No","Yes")
)

cat("\nOverall survival:\n")
print(round(prop.table(table(titanic_clean$SurvivedLabel))*100,2))

cat("\nSurvival by sex:\n")
print(round(prop.table(table(titanic_clean$Sex,titanic_clean$SurvivedLabel),1)*100,2))

cat("\nSurvival by passenger class:\n")
print(round(prop.table(table(titanic_clean$Pclass,titanic_clean$SurvivedLabel),1)*100,2))

cat("\nSurvival by title:\n")
print(round(prop.table(table(titanic_clean$Title,titanic_clean$SurvivedLabel),1)*100,2))

# 10. CORRELATION
num_vars <- data.frame(
  Survived=titanic_clean$Survived,
  Age=titanic_clean$Age,
  Fare_capped=titanic_clean$Fare_capped,
  SibSp=titanic_clean$SibSp,
  Parch=titanic_clean$Parch,
  FamilySize=titanic_clean$FamilySize,
  Sex_male=titanic_clean$Sex_male
)
corr_matrix <- round(cor(num_vars, use="complete.obs"),3)
print(corr_matrix)

melted_corr <- melt(corr_matrix)
p6 <- ggplot(melted_corr, aes(Var1,Var2,fill=value)) +
  geom_tile() +
  geom_text(aes(label=value),size=3) +
  labs(title="Correlation Heatmap of Numeric Variables",x="",y="") +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45,hjust=1))
ggsave("plots/06_correlation_heatmap.png",p6,width=7,height=6,dpi=150)

# 11. VISUALIZATIONS
p2 <- ggplot(titanic_clean,aes(x=Age)) +
  geom_histogram(binwidth=5) +
  labs(title="Age Distribution After Imputation",x="Age",y="Count") +
  theme_minimal()
ggsave("plots/02_age_distribution.png",p2,width=7,height=5,dpi=150)

p4 <- ggplot(titanic_clean,aes(x=Sex,fill=SurvivedLabel)) +
  geom_bar(position="dodge") +
  labs(title="Survival Count by Sex",x="Sex",y="Count") +
  theme_minimal()
ggsave("plots/04_survival_by_sex.png",p4,width=7,height=5,dpi=150)

p5 <- ggplot(titanic_clean,aes(x=Pclass,fill=SurvivedLabel)) +
  geom_bar(position="fill") +
  labs(title="Survival Proportion by Passenger Class",x="Passenger Class",y="Proportion") +
  theme_minimal()
ggsave("plots/05_survival_by_class.png",p5,width=7,height=5,dpi=150)

p7 <- ggplot(titanic_clean,aes(x=Age,fill=SurvivedLabel)) +
  geom_density(alpha=.5) +
  labs(title="Age Density by Survival Outcome",x="Age",y="Density") +
  theme_minimal()
ggsave("plots/07_age_density_survival.png",p7,width=7,height=5,dpi=150)

p8 <- ggplot(titanic_clean,aes(x=FamilySize,fill=SurvivedLabel)) +
  geom_bar(position="fill") +
  labs(title="Survival Proportion by Family Size",x="Family Size",y="Proportion") +
  theme_minimal()
ggsave("plots/08_survival_by_familysize.png",p8,width=7,height=5,dpi=150)

# 12. SAVE OUTPUT
write.csv(titanic_clean,"outputs/titanic_cleaned.csv",row.names=FALSE)
cat("\nFinal dimensions:",dim(titanic_clean)[1],"rows x",dim(titanic_clean)[2],"columns\n")
