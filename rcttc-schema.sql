drop database if exists tiny_theaters;
create database tiny_theaters;
use tiny_theaters;

create table theater (
	theater_name varchar(25) primary key,
    theater_address varchar(100) not null,
    theater_phone varchar(25) not null,
    theater_email varchar(50) not null
);

create table production (
	production_id int primary key auto_increment,
	production_name varchar(100),
    production_date date not null,
    theater_name varchar(25) not null,
    constraint fk_production_theater_name
    foreign key (theater_name)
    references theater(theater_name)
);

create table customer (
	customer_email varchar(50) primary key,
    customer_first varchar(25) not null,
    customer_last varchar(25) not null,
    customer_phone varchar(25),
    customer_address varchar(50)
    );       

create table ticket (
	ticket_id int primary key auto_increment,
    ticket_price decimal(4,2) not null,
    seat varchar(2) not null,
    production_date date not null,
    production_name varchar(100) not null,
    customer_email varchar(50) not null,
    constraint fk_ticket_customer_email
    foreign key (customer_email)
    references customer(customer_email)
);

 
    