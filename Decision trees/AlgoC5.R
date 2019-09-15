> library(readr)
> credit <- read_csv("Machine-Learning-with-R-Third-Edition-master/Chapter05/credit.csv")
Parsed with column specification:
cols(
  checking_balance = col_character(),
  months_loan_duration = col_double(),
  credit_history = col_character(),
  purpose = col_character(),
  amount = col_double(),
  savings_balance = col_character(),
  employment_duration = col_character(),
  percent_of_income = col_double(),
  years_at_residence = col_double(),
  age = col_double(),
  other_credit = col_character(),
  housing = col_character(),
  existing_loans_count = col_double(),
  job = col_character(),
  dependents = col_double(),
  phone = col_character(),
  default = col_character()
)
> View(credit)

