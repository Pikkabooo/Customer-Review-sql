SELECT 
	product_name,
	ROUND( AVG(rating), 2 ) as average_rating
FROM Reviews
JOIN Products ON Reviews.product_id = Products.product_id
GROUP BY product_name;
