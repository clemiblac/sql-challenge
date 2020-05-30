--Examining the different table
select * from film;

select * from inventory;

--Creating the view
Drop view if exists title_count;

Create View title_count As
select 
film_id,
count(film_id) as number_of_copies,
(select title from film f where f.film_id=i.film_id)
from inventory i
group by film_id;

--Make a selection from the view
select title,number_of_copies from title_count
where number_of_copies = 7
ORDER BY title;