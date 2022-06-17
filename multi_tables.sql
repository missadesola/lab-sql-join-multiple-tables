-- Write a query to display for each store its store ID, city, and country.
SELECT store.store_id AS store_id, city.city AS city, country.country AS country
FROM store
JOIN address
ON address.address_id=store.address_id
JOIN city
ON city.city_id=address.city_id
JOIN country
ON country.country_id=city.country_id;

-- Write a query to display how much business, in dollars, each store brought in.
SELECT store.store_id AS store_id, payment.amount AS amount
FROM store
JOIN customer
ON customer.store_id=store.store_id
JOIN payment
ON payment.customer_id=customer.customer_id;

-- What is the average running time of films by category?
SELECT category.name AS category_name, AVG(film.length)
FROM category
JOIN film_category
ON film_category.category_id=category.category_id
JOIN film
ON film.film_id=film_category.film_id
GROUP BY category_name;

-- Which film categories are longest?
SELECT category.name AS film_category_name, film.length
FROM category
JOIN film_category
ON category.category_id=film_category.category_id
JOIN film
ON film.film_id=film_category.film_id
ORDER BY film_category_name DESC
LIMIT 1;

-- Display the most frequently rented movies in descending order.
SELECT film.title AS title, COUNT(rental.rental_id) AS count
FROM film
JOIN inventory
ON film.film_id=inventory.film_id
JOIN rental
ON rental.inventory_id=inventory.inventory_id
GROUP BY title  
ORDER BY count DESC;

-- List the top five genres in gross revenue in descending order.
SELECT category.name AS genres, SUM(payment.amount) AS revenue
FROM category
JOIN film_category
ON film_category.category_id=category.category_id
JOIN film
ON film.film_id=film_category.film_id
JOIN inventory
ON inventory.film_id=film.film_id
JOIN rental
ON rental.inventory_id=inventory.inventory_id
JOIN payment
ON payment.rental_id=rental.rental_id
GROUP BY genres
ORDER BY revenue DESC
LIMIT 5;

-- Is "Academy Dinosaur" available for rent from Store 1?
SELECT film.title AS title, store.store_id AS store_id, COUNT(inventory.film_id) AS count
FROM film
JOIN inventory
ON inventory.film_id=film.film_id
JOIN store
ON store.store_id=inventory.store_id
WHERE film.title = 'Academy Dinosaur' AND store.store_id = 1
GROUP BY title, store_id;



