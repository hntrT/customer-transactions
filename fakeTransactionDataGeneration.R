# Author: Hunter Tolbert
# Date Created: June 2021

# make vectors 5000 observations long to put into a dataframe

#unique ID for transactions
transID <- 1:5000
transID <- as.character(transID)

# normally distributed transaction amounts
transactionAmount <- round(abs(rnorm(5000, 500, 200)) + runif(1), 2)

# randomly selected dates between 2002 and 2020
transactionDate <- sample(seq(as.Date('2002/01/01'), as.Date('2020/01/01'), by="day"), 5000, replace=TRUE)

# 100 different products
productID <- sample(1:100, 5000, replace=TRUE)
productID <- as.character(productID)

# 1000 unique customers
customerID <- sample(1:1000, 5000, replace=TRUE)
customerID <- as.character(customerID)

# 4 product categories
productCategory <- ifelse(productID < 20, "A", ifelse(productID < 50, "B", ifelse(productID < 90, "C", "D")))
productCategory <- as.factor(productCategory)

# approximately a 50/50 distribution of gender
customerGender <- ifelse(customerID < 500, "Male", "Female")
customerGender <- as.factor(customerGender)

df <- data.frame(c(transID, transactionAmount, transactionDate, productID, productCategory, customerID, customerGender))
write.csv(df, "customer-transactions.csv")