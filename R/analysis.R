# ============================================================
# analysis.R
# Purpose: Explore synthetic customer purchase data
# Author: [Your Name]
# Date: 2026-10-27
# ============================================================

# Load required packages
library(tidyverse)
library(lubridate)

# ------------------------------------------------------------
# 1. Load data
# ------------------------------------------------------------
customers <- read_csv("data/synthetic_customers.csv", show_col_types = FALSE)

# ------------------------------------------------------------
# 2. Quick data checks
# ------------------------------------------------------------
glimpse(customers)
summary(customers$purchase_amount)

# ------------------------------------------------------------
# 3. Data cleaning / preparation
# ------------------------------------------------------------
customers_clean <- customers %>%
  mutate(
    purchase_date = ymd(purchase_date),
    age_group = case_when(
      age < 30 ~ "18-29",
      age < 45 ~ "30-44",
      TRUE     ~ "45+"
    )
  )

# ------------------------------------------------------------
# 4. Key summary statistics
# ------------------------------------------------------------
# Average spend by region
region_summary <- customers_clean %>%
  group_by(region) %>%
  summarise(
    n_customers = n(),
    avg_spend   = mean(purchase_amount, na.rm = TRUE),
    total_spend = sum(purchase_amount, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(avg_spend))

print(region_summary)

# Average spend by category
category_summary <- customers_clean %>%
  group_by(category) %>%
  summarise(
    n_purchases = n(),
    avg_spend   = mean(purchase_amount, na.rm = TRUE),
    .groups = "drop"
  )

print(category_summary)

# ------------------------------------------------------------
# 5. Simple visualization
# ------------------------------------------------------------
p <- ggplot(customers_clean, aes(x = region, y = purchase_amount, fill = region)) +
  geom_boxplot(alpha = 0.7) +
  labs(
    title = "Purchase Amount by Region",
    x = "Region",
    y = "Purchase Amount ($)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

print(p)

# Optional: save plot
# ggsave("output/spend_by_region.png", p, width = 7, height = 5)
