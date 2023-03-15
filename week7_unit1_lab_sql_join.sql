USE sakila;

# 1. List the number of films per category.
SELECT c.category_id, c.name, COUNT(*) AS num_films
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id;

# 2. Display the first and the last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address, a.district, c.city
FROM staff s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id;

# 3. Display the total amount rung up by each staff member in August 2005.
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE p.payment_date >= '2005-08-01%' AND p.payment_date < '2005-09-01%'
GROUP BY s.staff_id, s.first_name, s.last_name;

# 4. List all films and the number of actors who are listed for each film.
SELECT f.film_id, f.title, COUNT(*) AS num_actors
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title;

# 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_amount_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name;
