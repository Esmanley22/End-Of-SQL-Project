
CREATE TABLE Salesperson (
	salesperson_id SERIAL primary key
);

CREATE TABLE Customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

CREATE TABLE Service_Facility (
	mechanic_id SERIAL primary key,
	car_parts VARCHAR(150),
	amount NUMERIC(200,2),
	service_ticket_id Integer
);

CREATE TABLE Service_Ticket (
	service_ticket_id SERIAL primary key,
	mechanic_id Integer,
	service_date DATE default CURRENT_DATE,
	sub_total NUMERIC (8,2),
	total_cost NUMERIC (10,2),
	amount NUMERIC(5, 2),
	customer_id Integer,
	mechanic_id Integer,
	serial_number_id Integer,
	foreign key (amount) references Customer(address),
	foreign key (service_date) references Service_Facility(service_ticket_id)
);

CREATE TABLE Car (
	serial_number_id SERIAL primary key,
	amount NUMERIC(5, 2),
	vehicle_model VARCHAR(50),
	vehicle_year NUMERIC(4),
	customer_id Integer
);

CREATE TABLE Invoice (
	invoice_id SERIAL primary key,
	salesperson_id Integer,
	customer_id Integer,
	serial_number_id Integer,
	foreign key (serial_number_id) references Dealership(serial_number_id)
);

CREATE TABLE Car_Inventory (
	vehicle_spot_id SERIAL primary key,
	amount NUMERIC(5, 2),
	serial_number_id Integer,
	foreign key (vehicle_spot_id) references Dealership(salesperson_id)
);

CREATE TABLE Dealership (
	serial_number_id INTEGER not null,
	salesperson_id INTEGER not null,
	mechanic_id INTEGER not null,
	service_ticket_id INTEGER not null,
	vehicle_spot_id INTEGER not null,
	invoice_id INTEGER not null,
	foreign key (serial_number_id) references Car(serial_number_id),
	foreign key (salesperson_id) references Salesperson(salesperson_id),
	foreign key (mechanic_id) references Service_Facility(mechanic_id),
	foreign key (service_ticket_id) references Service_Ticket(service_ticket_id),
	foreign key (vehicle_spot_id) references Car_Inventory(vehicle_spot_id),
	foreign key (invoice_id) references Invoice(invoice_id)
);

