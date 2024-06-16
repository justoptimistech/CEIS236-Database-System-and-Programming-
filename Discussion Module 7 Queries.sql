/*
A query to find all items with low inventory
*/

SELECT*
FROM Item
ORDER BY ItemOnHand desc;

/*
A query to find all items with a name that begin with 'S'
*/

SELECT ItemDescription
FROM Item
WHERE ItemDescription like 'S%';

/*
A query to find all items that cost more than $10
*/

Select *
FROM Item
Where ItemPrice > 10;

