
--Q1 BANK Version;
Select customer_name, Max(y.num)
From (
	Select customer_name, Count(customer_name) as num
	From Depositor
	Group By customer_name) y
Group by customer_name;