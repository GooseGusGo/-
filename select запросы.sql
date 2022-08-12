SELECT title, COUNT(actor_id) actor_q FROM film f
JOIN film_actor a ON f.film_id = a.film_id
GROUP BY f.title
ORDER BY actor_q DESC;
