--Using subqueries, identify all actors who appear in the film ALTER VICTORY 
--Examine columns in film table
select * from film
where title='ALTER VICTORY';
--Examine columns from film_actor table
select * from film_actor;
--Examine columns from actor table
select * from actor;

--Building subquery
select ac.actor_id, ac.first_name, ac.last_name, f.film_id from actor ac, film_actor f
where ac.actor_id in
(select f.actor_id from film_actor
where 
f.film_id = (select film_id from film where title='ALTER VICTORY'));

--Using subqueries, display the titles of films that the employee Jon Stephens rented to customers
--explore staff table
select * from staff;
--explore the rental table
select * from rental;
--explore inventory table
select * from inventory;
--explore film table
select * from film;

select title from film where film_id in
(select film_id from inventory 
 where film_id in
(select inventory_id from rental 
where staff_id in
(select staff_id from staff where staff_id=2)));