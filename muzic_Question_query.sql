-- Question 1: who is the moset senior employee based on job title?

-- select levels
-- from employee
-- order by levels DESC
-- limit 1;


-- Question 2:which country has the most invoices? 

-- select count(*) as c,billing_country
-- from invoice
-- group by billing_country 
-- order by c DESC;

-- Question 3:what are the top 3 values of total invoices? 

-- select total
-- from invoice
-- order by total desc
-- limit 3


-- Question 4:which city has the best customers? we whould like to throw a promotional music festival in the city we made the most money.
-- write a Query that returns one city that has the highest sum of invoice total.returns both the city name & sum of all invoices totals.

-- select billing_city,sum(total) as total_invoice_city_wise
-- from invoice
-- group by billing_city
-- order by  total_invoice_city_wise DESC
-- limit 1;


-- Question 5:who is the best customer?the customer who has spent the most money will be declared the best customer.
-- write Queary that returns the person who has spent the most moeny

-- select customer.customer_id, customer.first_name,customer.last_name,sum(invoice.total) as total
-- from customer
-- join invoice
-- on customer.customer_id = invoice.customer_id
-- group by customer.customer_id
-- order by total DESC
-- limit 1;

-- SELECT c.customer_id, c.first_name
-- FROM customer AS c
-- JOIN invoice AS i
-- ON c.customer_id = i.customer_id
-- GROUP BY c.customer_id
-- ORDER BY c.first_name;







-- Question set 2: Moderate 

-- Question 1 : Write Query to return the email,first name,last name & Genre of all Rock music listeners.Return your list ordered 
-- alphabetically by email starting with A?

-- select distinct email,first_name,last_name
-- from customer
-- join invoice
-- on customer.customer_id = invoice.invoice_id
-- join invoice_line
-- on invoice.invoice_id = invoice_line.invoice_id
-- where track_id in(
-- 	select track_id
--     from genre
--     join track
--     on genre.genre_id = track.genre_id
--     where genre.name like "rock"		)
-- order by email; 



-- Question:2 let's invite the artists who have written the most rock music in our database.write a queary that returns the artist name 
-- and total track count of top 10 rock bands


-- select artist.artist_id, artist.name,genre.name,count(artist.artist_id)as number_of_songs
-- from track
-- join album
-- on track.album_id = album.album_id
-- join artist
-- on artist.artist_id = album.artist_id
-- join genre
-- on track.genre_id = genre.genre_id
-- where genre.name = "rock"
-- group by artist.artist_id



-- Question:3  return all the track names that have a song length longer than the average song lenght.return the name and milliseconds 
-- for each track.order by the length with the longest songs listed first









-- Question set 3: Advance

-- Question 1: find how much amount spent by each customer on artist? wtite a Queary to return customer name, arist name and total spent?


-- WITH best_selling_artist AS (
-- 		SELECT
-- 			artist.artist_id,
--             artist.artist_name,
-- 			SUM(invoice_line.unit_price * invoice_line.quantity) as total_sales
--         FROM invoice_line
--         JOIN track
-- 			ON track.track_id = invoice_line.track_id
--         JOIN album
-- 			ON album.album_id = track.album_id
--         JOIN artist
-- 			ON artist.artist_id = album.album_id
--         GROUP BY artist.artist_id, artist.artist_name
-- )
-- SELECT
-- 	customer.customer_id,
--     customer.first_name,
--     customer.last_name,
--     best_selling_artist.artist_name,
--     best_selling_artist.total_sales
-- FROM customer
-- JOIN invoice
-- 	ON customer.customer_id = invoice.customer_id
-- JOIN invoice_line
-- 	ON invoice.invoice_id = invoice_line.invoice_id
-- JOIN track
-- 	ON track.track_id = invoice_line.track_id
-- JOIN album
-- 	ON album.album_id = track.album_id
-- JOIN best_selling_artist
-- 	ON album.artist_id = best_selling_artist.artist_id
-- GROUP BY customer.customer_id, customer.first_name, customer.last_name, best_selling_artist.artist_name, best_selling_artist.total_sales
-- ORDER BY best_selling_artist.total_sales DESC;





with best_selling_artist as(
select
	artist.artist_id,
	artist.artist_name,
	sum(invoice_line.unit_price * invoice_line.quantity) as total_sales
from invoice_line
join track
on track.track_id = invoice_line.track_id
join album
on album.album_id = track.album_id
join artist
on artist.artist_id = album.album_id
group by artist.artist_id 
order by total_sales desc
limit 1
)

select customer.customer_id,
	   customer.first_name,
       customer.last_name,
       best_selling_artist.artist_name, 
	   sum(invoice_line.unit_price * invoice_line.quantity) as amount_spent
from invoice
join customer
on customer.customer_id =  invoice.customer_id
join invoice_line
on invoice_line.invoice_id = invoice.invoice_id
join track
on track.track_id = invoice_line.track_id
join album
on  album.album_id = track.album_id
join best_selling_artist
on best_selling_artist.artist_id = album.artist_id
group by 1,2,3,4
order by 5 desc




