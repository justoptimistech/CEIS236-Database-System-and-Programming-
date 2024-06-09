/*
Problem 1
Write a query to count the number of invoices by customers, using the output shown in the following
figure as your guide. Sort the results by customer code. Note that the first row needs to show YOUR
last name and YOUR first name. You will need to join CUSTOMER and INVOICE. (hint: use GROUP BY customer.CUS_CODE at the bottom of your query)
*/

select invoice.CUS_CODE, CUS_LNAME, CUS_FNAME, COUNT(INV_NUMBER) AS NUM_INVOICES
from invoice, customer
where invoice.CUS_CODE = customer.CUS_CODE
GROUP BY customer.CUS_CODE;

/*
Problem 2
Generate a listing of all purchases made by the customers, using the output shown in the following as
your guide. Sort the results by customer code, invoice number, and product description. You will need to
join INVOICE, LINE, PRODUCT
*/

select cus_code, invoice.Inv_number, inv_date, P_DESCRIPT, LINE_UNITS, line_price
from invoice
join line on invoice.inv_number = line.INV_NUMBER
join product on line.p_code = product.p_code
order by invoice.cus_code, invoice.inv_number, P_DESCRIPT;

/*
Problem 3
Create a query to produce the total purchase per invoice, generating the results shown in the following
Figure, sorted by invoice number. The invoice total is the sum of the product purchases in the LINE that
corresponds to the INVOICE.
*/

select inv_number, sum(line_units * line_price) as 'Invoice Total'
from line
group by inv_number
order by inv_number;

/*
Problem 4
List the balances of customers who have made purchases during the current invoice cycle—that is, for
the customers who appear in the INVOICE table. Sort the results by customer code, as shown in the
following Figure. Note: you will need to use the DISTINCT keyword and join the INVOICE and
CUSTOMER tables
*/

select distinct customer.cus_code, cus_balance
from customer
join invoice on invoice.CUS_CODE = customer.cus_code;

/*
Problem 5
Create a query to find the balance characteristics for all customers (ie sum, min, max, and average). The
results of this query are shown in the following Figure. (hint: use ROUND and AVG functions for the
last column)
*/

select sum(cus_balance) as 'Total Balance', MIN(cus_balance) as 'Minimum Balance', 
max(cus_balance) as 'Maximum Balance', round(avg(cus_balance),2) as 'Average Balance'
from customer;

/*
Problem 6
Using the output shown in the following Figure as your guide, generate a list of customer purchases,
including the subtotals for each of the invoice line numbers. The subtotal is a derived attribute calculated
by multiplying LINE_UNITS by LINE_PRICE. Sort the output by customer code, invoice number, and
product description. Be certain to use the column aliases as shown in the figure. You will need to join
INVOICE, LINE, PRODUCT
*/

select CUS_CODE, invoice.INV_NUMBER, P_DESCRIPT, LINE_UNITS as 'Unit Bought', LINE_PRICE as 'Unit Price', (LINE_UNITS * LINE_PRICE) as Subtotal
from invoice
join line on invoice.inv_number = line.inv_number
join product on line.p_code = product.p_code
order by cus_code, invoice.inv_number, p_descript;

/*
Problem 7
Write a query to display the customer code, balance, and total purchases for each customer. Total
purchase is calculated by summing the line subtotals (as calculated in Problem 4) for each customer.
Sort the results by customer code, and use aliases as shown in the following Figure. You will need to
use the code SUM(LINE_UNITS * LINE_PRICE) and will need to GROUP BY
CUSTOMER.CUS_CODE, CUS_BALANCE. You will also need to join CUSTOMER, INVOICE, and
LINE
*/

SELECT customer.CUS_CODE, CUS_BALANCE, SUM(LINE_UNITS * LINE_PRICE) AS 'Total Purchases'
FROM customer
JOIN invoice ON customer.CUS_CODE = invoice.CUS_CODE
JOIN line on line.INV_NUMBER = invoice.INV_NUMBER
GROUP bY customer.CUS_CODE, CUS_BALANCE
ORDER BY customer.CUS_CODE;

/*
Problem 8
Find the listing of customers who did not make purchases during the invoicing period. Sort the results by
customer code. Your output must match the output shown in the following Figure. Use a subquery to
retrieve the cus_code from invoice. Then select all customers not in that subquery.
*/

SELECT CUS_CODE, CUS_BALANCE
FROM customer
WHERE CUS_CODE NOT IN
(SELECT CUS_CODE FROM invoice)
ORDER BY CUS_CODE;

/*
Problem 9
Find the customer balance summary for all customers who have not made purchases during the current
invoicing period. 
*/

SELECT SUM(CUS_BALANCE) AS 'Total Balance', MIN(CUS_BALANCE) AS 'Minimum Balance',
MAX(CUS_BALANCE) AS 'Maximum Balance', ROUND(AVG(CUS_BALANCE), 2) AS 'Average Balance'
FROM customer
WHERE CUS_CODE NOT IN
(SELECT CUS_CODE FROM invoice);

/*
Problem 10
Create a view named PRODUCT_INVENTORY that summarizes the value of products currently in
inventory. Note that the value of each product is a result of multiplying the units currently in inventory
by the unit price. Sort the results in descending order by subtotal, as shown in the following Figure. To
display all values in the view, use the code: SELECT * FROM PRODUCT_INVENTORY;
*/

CREATE OR REPLACE VIEW PRODUCT_INVENTORY AS
(SELECT P_DESCRIPT, P_QOH, P_PRICE, (P_QOH * P_PRICE) AS Subtotal
FROM product
ORDER BY Subtotal DESC);
SELECT * FROM PRODUCT_INVENTORY;

/*
Problem 11
Write a query using a left join to join all records from the vendor table and those that match from the
product table.
*/

SELECT *
FROM vendor LEFT JOIN product ON vendor.V_CODE = product.V_CODE;

/*
Problem 12
Write a query using subquery to list InvoiceNumber, InvoiceDate for those products with price bigger than 100. Also adjust the
Date format to match the table below
*/

SELECT i.INV_NUMBER AS InvoiceNumber, DATE_FORMAT(INV_DATE, '%m/%d/%Y') AS InvoiceDate,
l.P_CODE, l.LINE_PRICE
FROM invoice i
JOIN line l on i.INV_NUMBER = l.INV_NUMBER
WHERE l.P_CODE IN
	(SELECT P_CODE FROM product WHERE P_PRICE > 100);






 