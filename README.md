AI Assistance Declaration: OpenAI Codex (model version unavailable), 27 October 2026, assisted with documentation review, revision, formatting, and packaging. The supplied example attributes earlier drafting to Grok (xAI); its version, prompts, and prior verification are unconfirmed. Available prompts and key responses are recorded in AI_Prompts_Appendix.md. No analysis calculations were performed in this revision. Student verification, R execution, R Markdown knitting, and GitHub preview/upload remain pending. This statement does not attest that Vikas Palan performed those actions.

# Markdown Buddy: Synthetic Customer Purchases

**Vikas Palan | BDA400 Assignment 1 | 27 October 2026**

## Overview

This educational R project explores fictional customer purchases and demonstrates clear Markdown and R Markdown documentation. The supplied script inspects the data, prepares dates and age groups, prints summaries by region and category, and displays a regional boxplot. It creates age groups but does not analyze spending by age group.

**Status:** reviewed documentation draft. Script execution, knitting, numerical verification, and publication remain pending.

## Project structure

```text
markdown-buddy-vikaspalan/
  README.md
  analysis_documentation.Rmd
  Reflection.md
  AI_Prompts_Appendix.md
  Verification.md
  R/analysis.R
  data/synthetic_customers.csv
  LICENSE
  .gitignore
```

## Installation

1. Download this repository with **Code > Download ZIP** and extract it, or use:

   ```bash
   git clone https://github.com/vikpalan-cdi/markdown-buddy-vikaspalan.git
   cd markdown-buddy-vikaspalan
   ```

2. Open the extracted folder in RStudio or Posit Cloud. Set the working directory to the project root containing this README.
3. Install the dependencies from the R console:

   ```r
   install.packages(c("tidyverse", "lubridate", "rmarkdown", "knitr"))
   ```

R and Pandoc are required to render the HTML documentation. RStudio normally supplies Pandoc. No minimum R version has been tested for this package.

## Example code and usage

Run the supplied script from the project root:

```r
source("R/analysis.R")
```

Open `analysis_documentation.Rmd` and select **Knit**, or run:

```r
rmarkdown::render("analysis_documentation.Rmd", output_format = "html_document")
```

These are instructions, not evidence of a successful run. Knitting executes the analysis chunks.

## Data dictionary

The CSV contains 15 fictional purchase records; no real customer records are used.

| Column | Meaning | Format |
| --- | --- | --- |
| `customer_id` | Fictional identifier | Text, such as `C001` |
| `age` | Fictional age in years | Numeric |
| `gender` | Synthetic demographic label | Text |
| `region` | Fictional region | West, East, Central |
| `purchase_amount` | Fictional purchase value | Numeric; currency unspecified |
| `purchase_date` | Fictional purchase date | `YYYY-MM-DD` |
| `category` | Fictional product category | Electronics, Clothing, Home |

## Outputs and limitations

- Console inspection: a data overview and purchase-amount summary.
- `region_summary`: record count, mean purchase amount, and total purchase amount by region, sorted by descending mean.
- `category_summary`: record count and mean purchase amount by category.
- A boxplot displayed in the R plotting device.

Tables and plots are not saved by default. The optional `ggsave()` line is commented out; create an `output/` directory before enabling it. The chart's dollar sign is a display label; the CSV does not identify a currency.

Every West record is Electronics, every East record is Clothing, and every Central record is Home. Region and category are confounded, so their separate effects cannot be inferred. The small synthetic dataset does not support real customer or causal conclusions.

The script's `n_customers` counts rows, not distinct identifiers. It represents customers only while each customer appears once. Missing ages would fall into the final `45+` branch; review that logic before using different data. Missing purchase amounts are excluded from means and totals.

The inherited static numerical table was removed because it lacked verification evidence. Complete [Verification.md](Verification.md) before adding results.

## Documentation approach

Overview, Installation, and Usage also appear in the [ggplot2 README](https://github.com/tidyverse/ggplot2/blob/main/README.md). This project adds data, limitations, and verification details rather than package badges or development claims.

Formatting references: [GitHub Markdown syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) and [R Markdown code chunks](https://rmarkdown.rstudio.com/lesson-3.html).

## License

The supplied [MIT license](LICENSE) is retained unchanged with its existing attribution. This revision does not claim new ownership of the example.

## AI Assistance Disclosure

- **Tools:** OpenAI Codex for this revision; Grok (xAI) is attributed in the supplied example. Exact model versions are unavailable.
- **Prompts:** [AI_Prompts_Appendix.md](AI_Prompts_Appendix.md) distinguishes available requests, inherited prompt text, and suggestions not yet executed.
- **Changes:** replaced placeholders, aligned scope with the script, removed unverified results and unsupported completion claims, and added limitations and a verification plan.
- **Remaining review:** Vikas Palan must understand and personalize the work, run the script, knit the `.Rmd`, verify calculations directly if reporting results, and preview the uploaded files. Those actions are not asserted here.
