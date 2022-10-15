--create the salesman
create or replace function add_salesperson(_salesperson_id INTEGER, _salesperson_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into salesperson(salesperson_id,salesperson_name)
	values (_salesperson_id,_salesperson_name );
end;
$MAIN$
language plpgsql;

--call of function 
select add_salesperson(1,'Dwight Schrute');

--Verify addition
select * from salesperson




--create the customer
create or replace function add_customer(_customer_id INTEGER,_first_name VARCHAR,_last_name VARCHAR,_address VARCHAR,_billing_info VARCHAR)
returns void
as $MAIN$
begin 
	insert into Customer(customer_id,first_name,last_name,address,billing_info)
	values (_customer_id,_first_name,_last_name,_address,_billing_info);
end;
$MAIN$
language plpgsql;

--call of function 
select add_customer(1, 'Jordan', 'Belfort', '555 Wall Street Dr', '555-555-5555');

--Verify addition
select * from Customer;
