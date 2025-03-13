CREATE DATABASE pizzahut;


create table orders(
                   order_id int not null primary key,
                   order_date date not null,
                   order_time time not null
);


create table order_details (
							order_details_id int not null primary key,
                            order_id int not null,
                            pizza_id text not null,
                            quantity int not null
                            );
                            
select * from pizzas;
select * from pizza_types;
select * from orders;
select * from  order_details; 
                 

