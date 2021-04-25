use tiny_theaters;

/* Customer insert */
select distinct 
customer_first, 
customer_last, 
customer_email,
customer_phone,
customer_address
from theater_data;

insert into customer (
customer_first, 
customer_last, 
customer_email,
customer_phone,
customer_address)
select distinct 
customer_first, 
customer_last, 
customer_email,
customer_phone,
customer_address
from theater_data;

select * 
from customer;

/* Theater insert */

select distinct
theater,
theater_address,
theater_phone,
theater_email
from theater_data;

insert into theater (
theater_name,
theater_address,
theater_phone,
theater_email
)
select distinct
theater,
theater_address,
theater_phone,
theater_email
from theater_data;

select *
from theater;

/* Production insert */

select distinct
`show`,
`date`,
theater
from theater_data;

insert into production (
production_name,
production_date,
theater_name
)
select distinct
`show`,
`date`,
theater
from theater_data;

select *
from production;

/* Ticket insert */
select distinct
p.production_date,
p.production_name,
t.seat,
t.ticket_price,
c.customer_email
from theater_data t
inner join production p on t.`show` = p.production_name
and p.production_date = t.`date`
inner join customer c on t.customer_email = c.customer_email;

insert into ticket (
production_date,
production_name,
seat,
ticket_price,
customer_email)
select distinct
p.production_date,
p.production_name,
t.seat,
t.ticket_price,
c.customer_email
from theater_data t
inner join production p on t.`show` = p.production_name
and p.production_date = t.`date`
inner join customer c on t.customer_email = c.customer_email;

drop table if exists theater_data;

/* Change ticket price for 2021-03-01 performance of The Sky Lit Up at Little Fitz */

select *
from ticket
where production_date = '2021-03-01' and production_name = 'The Sky Lit Up';

set sql_safe_updates = 0;
update ticket set
ticket_price = 22.25
where production_date = '2021-03-01' and production_name = 'The Sky Lit Up';

/* Adjust seating for above show so all groups are seated together */
update ticket set
seat = 'B1'
where ticket_id = 91;

update ticket set
seat = 'B2'
where ticket_id = 92;

update ticket set
seat = 'B3'
where ticket_id = 93;

update ticket set
seat = 'B4'
where ticket_id = 94;

update ticket set
seat = 'C1'
where ticket_id = 95;

update ticket set
seat = 'C2'
where ticket_id = 96;

update ticket set
seat = 'A4'
where ticket_id = 97;

/* Update Jammie Swindles’ phone number */

update customer set
customer_phone = '1-801-EAT-CAKE'
where customer_email = 'jswindlesd9@studiopress.com';

select *
from customer
where customer_last = 'Swindles';

/* Delete all single ticket reservations for 10 Pin */

select 
t.production_date,
t.production_name,
t.customer_email,
th.theater_name
from ticket t
inner join production p on t.production_date = p.production_date
	and t.production_name = p.production_name
inner join theater th on th.theater_name = p.theater_name
where th.theater_name = '10 Pin';

set sql_safe_updates = 0;
delete from ticket
where production_date = '2021-03-01' and customer_email = 'hglendiningcg@blog.com';
 
delete from ticket
where production_date = '2021-09-24' and customer_email = 'fcrowcherkg@dagondesign.com';

delete from ticket
where production_date = '2021-09-24' and customer_email = 'lplaydonmf@whitehouse.gov';

delete from ticket
where production_date = '2021-09-24' and customer_email = 'bbake2c@opera.com';

delete from ticket
where production_date = '2021-01-04' and customer_email = 'lroisqb@apache.org';

delete from ticket
where production_date = '2021-01-04' and customer_email = 'eduffreear@discovery.com';

delete from ticket
where production_date = '2021-09-24' and customer_email = 'gbachmann6v@tuttocitta.it';

delete from ticket
where production_date = '2021-01-04' and customer_email = 'mfeighrygk@cdc.gov';

delete from ticket
where production_date = '2021-12-21' and customer_email = 'ctreherqc@java.com';

/* Delete customer Liv Egle of Germany */

select 
customer_last,
customer_email
from customer
where customer_last = 'Egle of Germany';

delete from ticket
where customer_email = 'legleofgermanybh@blinklist.com';

delete from customer
where customer_email = 'legleofgermanybh@blinklist.com';
