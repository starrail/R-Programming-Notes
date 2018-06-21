#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#profit for each month
profit_month = revenue - expenses
profit_month

#profit after tax for each month
revenue_tax = round( revenue - revenue * (0.3) ) #round to integer
profit_tax = revenue_tax - expenses
profit_tax

#profit margin to each month
profit_margin = round( profit_tax / revenue )
profit_margin

#good month or bad month
profit_mean = round(sum(profit_tax)/12)
month <- profit_tax > profit_mean
for(i in 1:12){
  if(month[i]==TRUE){
    print("good month")
  } else {
    print("bad month")
  }
}
######################???????????????????????????????????????

#best month
best_month = max(profit_tax)
best_month

#worst month 
worst_month = min(profit_tax)
worst_month
