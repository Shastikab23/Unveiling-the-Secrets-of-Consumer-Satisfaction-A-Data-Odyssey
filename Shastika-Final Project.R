#### Final Project ####
#### Submitted By ####
# Shastika Bhandari #

### Loading Packages ###
install.packages("ggplot2")
install.packages("dplyr")
install.packages("reshape2")

### Load the dataset ###
data <- read.csv("/Users/shastikabhandari/Desktop/articles.csv")
colnames(data)
str(data)

### Relationship Between Age and Satisfaction ###
# Load necessary libraries
library(ggplot2)
library(dplyr)
# Replace 'age' and 'satisfaction' with valid column names or proxies
# For this example, we use 'product_type_no' as a proxy for age and 'graphical_appearance_no' for satisfaction
data$age <- as.numeric(data$product_type_no)  # Example proxy for age
data$satisfaction <- as.numeric(data$graphical_appearance_no)  # Example proxy for satisfaction

# Check for NA values and clean the data
cleaned_data <- data %>%
  filter(!is.na(age) & !is.na(satisfaction))

# Verify cleaned data
cat("Number of rows after cleaning:", nrow(cleaned_data), "\n")
head(cleaned_data)  # Inspect first few rows

# Perform linear regression
age_satisfaction_model <- lm(satisfaction ~ age, data = cleaned_data)

# Display model summary
cat("Linear Regression Model Summary:\n")
summary(age_satisfaction_model)

# Scatterplot with regression line
ggplot(cleaned_data, aes(x = age, y = satisfaction)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue") +
  labs(
    title = "Age vs Satisfaction",
    x = "Age (proxy: product_type_no)",
    y = "Satisfaction (proxy: graphical_appearance_no)"
  )

### Impact of Product Category on Passenger Satisfaction ###

library(ggplot2)
data$satisfaction <- as.numeric(data$satisfaction)  # Ensure numeric satisfaction values
product_category_anova <- aov(satisfaction ~ product_type_name, data = data)
summary(product_category_anova)

# Visualization
ggplot(data, aes(x = product_type_name, y = satisfaction, fill = product_type_name)) +
  geom_boxplot() +
  labs(title = "Impact of Product Category on Satisfaction",
       x = "Product Category", y = "Satisfaction") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Color and Demographic Analysis ###
library(ggplot2)
library(dplyr)

# Ensure valid columns for color and demographic metric
data$demographic_metric <- as.factor(data$index_name)  # Replace index_name with a valid demographic column
cleaned_data <- data %>%
  filter(!is.na(colour_group_name) & !is.na(demographic_metric))

# Create contingency table
color_demo_table <- table(cleaned_data$colour_group_name, cleaned_data$demographic_metric)

# Perform chi-square test
color_demo_chisq <- chisq.test(color_demo_table)
print(color_demo_chisq)

# Visualization
ggplot(cleaned_data, aes(x = colour_group_name, fill = demographic_metric)) +
  geom_bar(position = "fill") +
  labs(title = "Color and Demographic Analysis",
       x = "Color Group", y = "Proportion", fill = "Demographic Metric") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Regression Analysis Between graphical_appearance_no and colour_group_code ###
# Regression analysis
library(ggplot2)
model <- lm(colour_group_code ~ graphical_appearance_no, data = data)

# Model summary
summary(model)

# Scatterplot with regression line
ggplot(data, aes(x = graphical_appearance_no, y = colour_group_code)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Regression Analysis: Graphical Appearance vs Color Group",
       x = "Graphical Appearance Number", y = "Color Group Code")

### Impact of colour_group_name on product_group_name ###
# Summarize data for visualization
library(ggplot2)
color_summary <- data %>%
  group_by(colour_group_name, product_group_name) %>%
  summarise(Count = n())

# Chi-squared test of independence
color_table <- table(data$colour_group_name, data$product_group_name)
chi_test_color <- chisq.test(color_table)
print(chi_test_color)

# Visualization
ggplot(color_summary, aes(x = colour_group_name, y = Count, fill = product_group_name)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Impact of Color Group on Product Group",
       x = "Color Group", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Relationship Between product_type_name and product_group_name ###
# Summarize data for visualization
library(ggplot2)
product_summary <- data %>%
  group_by(product_type_name, product_group_name) %>%
  summarise(Count = n())

# Chi-squared test of independence
product_table <- table(data$product_type_name, data$product_group_name)
chi_test <- chisq.test(product_table)
print(chi_test)

# Visualization
ggplot(product_summary, aes(x = product_type_name, y = Count, fill = product_group_name)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relationship Between Product Type and Product Group",
       x = "Product Type", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Product Group Analysis ###
library(ggplot2)

# Count the frequency of each product group
product_group_counts <- data %>%
  filter(!is.na(product_group_name)) %>%
  count(product_group_name, sort = TRUE)

# Bar plot of product groups
ggplot(product_group_counts, aes(x = reorder(product_group_name, n), y = n)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Most Popular Product Groups",
       x = "Product Group", y = "Count") +
  theme_minimal()

### Color Popularity by Product Type ###
# Bar plot of color proportions by product type
library(ggplot2)
ggplot(data, aes(x = product_type_name, fill = colour_group_name)) +
  geom_bar(position = "fill") +
  labs(title = "Color Distribution Across Product Types",
       x = "Product Type", y = "Proportion", fill = "Color Group") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Category Trends ###
# Heatmap of product categories by section
library(reshape2)

category_section_table <- table(data$product_type_name, data$section_name)
category_section_df <- as.data.frame(as.table(category_section_table))

ggplot(category_section_df, aes(x = Var2, y = Var1, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "steelblue") +
  labs(title = "Product Categories by Section",
       x = "Section", y = "Product Category", fill = "Frequency") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Demographic Trends in Product Preferences ###
# Bar plot showing product preferences by demographics
library(ggplot2)
ggplot(data, aes(x = product_type_name, fill = as.factor(index_name))) +
  geom_bar(position = "dodge") +
  labs(title = "Product Preferences by Demographics",
       x = "Product Type", y = "Count", fill = "Demographic Group") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Detailed Satisfaction Analysis ###
# Boxplot of satisfaction by color group
library(ggplot2)
ggplot(data, aes(x = colour_group_name, y = as.numeric(perceived_colour_value_id))) +
  geom_boxplot() +
  labs(title = "Satisfaction by Color Group",
       x = "Color Group", y = "Satisfaction (Value ID)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Sales Insights ###
# Stacked bar plot of departments and product groups
library(ggplot2)
ggplot(data, aes(x = department_name, fill = product_group_name)) +
  geom_bar() +
  labs(title = "Department Contribution to Product Groups",
       x = "Department", y = "Count", fill = "Product Group") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### Association Between Index and Sections ###
# Contingency table and chi-square test
library(ggplot2)
index_section_table <- table(data$index_name, data$section_name)
index_section_chisq <- chisq.test(index_section_table)
print(index_section_chisq)

# Visualize the distribution
ggplot(data, aes(x = index_name, fill = section_name)) +
  geom_bar(position = "fill") +
  labs(title = "Index Distribution Across Sections",
       x = "Index Name", y = "Proportion", fill = "Section") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

### End of File ###

