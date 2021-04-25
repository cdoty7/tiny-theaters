use tiny_theaters;

/*Find all performances in the last quarter of 2021 (Oct. 1, 2021 - Dec. 31 2021).*/
select
production_date,
production_name
from production
where production_date between '2021-10-01' and '2021-12-31';

/*List customers without duplication.*/
select distinct *
from customer;

/*Find all customers without a .com email address.*/
select distinct *
from customer
where customer_email like '%.com';

/*Find the three cheapest shows.*/
select distinct
production_name,
ticket_price
from ticket
order by ticket_price
limit 3;

/*List customers and the show they're attending with no duplication.*/
select distinct
c.customer_first,
c.customer_last,
t.customer_email,
t.production_name
from customer c
inner join ticket t on c.customer_email = t.customer_email;

/*List customer, show, theater, and seat number in one query.*/
select distinct
concat (c.customer_first, ' ', c. customer_last) as customer,
p.production_name as `show`,
p.production_date,
p.theater_name,
t.seat
from ticket t
inner join customer c on c.customer_email = t.customer_email
inner join production p on p.production_name = t.production_name
order by p.production_date;

/*Find customers without an address.*/
select *
from customer
where customer_address = '';

/*Recreate the spreadsheet data with a single query.*/
select 
c.customer_first,
c.customer_last,
c.customer_email,
c.customer_phone,
c.customer_address,
t.seat,
t.production_name as `show`,
t.ticket_price,
t.production_date,
p.theater_name,
th.theater_address,
th.theater_phone,
th.theater_email
from ticket t
inner join customer c on t.customer_email = c.customer_email
inner join production p on t.production_name = p.production_name
and t.production_date = p.production_date
inner join theater th on  p.theater_name = th.theater_name;

/*Count total tickets purchased per customer.*/
select count(*) as total_tickets,
customer_email
from ticket
group by customer_email
order by count(*) desc;

/*Calculate the total revenue per show based on tickets sold.*/
select 
count(ticket_id) * ticket_price as 'total revenue',
production_name,
production_date
from ticket
group by production_name and production_date;
/*Calculate the total revenue per theater based on tickets sold.*/

/*Who is the biggest supporter of RCTTC? Who spent the most in 2021?*/