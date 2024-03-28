
-- 1. What is an average rating for each product?
SELECT 
	product_name,
	ROUND( AVG(rating), 2 ) as average_rating
FROM Reviews
JOIN Products ON Reviews.product_id = Products.product_id
GROUP BY product_name;


-- 2. Who are the customers who have rated the product with more than 4 stars?

SELECT 
	Customers.name,
	Reviews.rating,
	Customers.contact_info
FROM Customers 
JOIN Reviews ON Customers.customer_id = Reviews.customer_id
WHERE rating > 4;


-- 3. How many time each customer has reviewed the product?

SELECT
	c.name,
	COUNT(*) AS review_count
FROM Reviews r
JOIN Customers c ON r.customer_id = c.customer_id
GROUP BY c.name;


-- 4. What is the average rating for each day of the week?
-- 0 = Sunday

SELECT 
	STRFTIME('%w', date) AS day_of_week,
	ROUND(AVG(rating), 2) AS average_rating
FROM Reviews
GROUP BY day_of_week;


-- 5. Which products got 3.5 stars and above?

SELECT 
	p.product_id,
	p.product_name,
	ROUND(AVG(rating), 2) AS average_rating
FROM Reviews r
JOIN Products p ON r.product_id = p.product_id
GROUP BY p.product_id
HAVING average_rating >= 3.5;


-- 6. What is the number of negative reviews (containing the word ‘disappointed’) ?

SELECT
	COUNT(review_text) AS negative_reviews
FROM Reviews
WHERE review_text LIKE '%disappointed%';


-- 7. Who are the customers that wrote a positive reviews and gave high rating (4 stars and above) ?

SELECT 
	c.customer_id,
	c.name,
	r.review_text,
	r.rating
FROM Reviews r
JOIN Customers c ON r.customer_id = c.customer_id
WHERE r.review_text LIKE '%excellent%' OR
			r.review_text LIKE '%impressive%' OR 
			r.review_text LIKE '%recommend%' AND 
			r.rating >= 4;


-- 8. What is the average number of words customers write in their reviews?
	
SELECT
	Customers.name,
	Customers.contact_info,
	ROUND(AVG(LENGTH(review_text)),0) AS average_word_count
FROM Customers
JOIN Reviews ON Reviews.customer_id = Customers.customer_id
GROUP BY Customers.name; 

