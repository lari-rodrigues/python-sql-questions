CREATE DATABASE store_dw;
USE store_dw;

CREATE TABLE stores (
    id varchar(100) PRIMARY KEY,
    name varchar(100)
);

CREATE TABLE calendar(
    id varchar(100) PRIMARY KEY,
    date DATE, 
    fiscal_year SMALLINT
);

CREATE TABLE products(
    id varchar(100) PRIMARY KEY, 
    name varchar(100), 
    category varchar(30)
);

CREATE TABLE employees(
    id VARCHAR(100) PRIMARY KEY, 
    store_id VARCHAR(100),
    name VARCHAR(100), 
    birth_date DATE, 
    admission_date DATE
);

CREATE TABLE customers(
    id VARCHAR(100) PRIMARY KEY, 
    name VARCHAR(100), 
    birth_date DATE
);

CREATE TABLE sales (
    id varchar(100) PRIMARY KEY,
    store_id varchar(100),
    product_id varchar(100),
    employee_id varchar(100),
    customer_id varchar(100),
    calendar_id varchar(100),
    date date,
    quantity SMALLINT,
    CONSTRAINT fk_sales_store_id FOREIGN KEY(store_id) REFERENCES stores(id),
    CONSTRAINT fk_sales_products_id FOREIGN KEY(product_id) REFERENCES products(id),
    CONSTRAINT fk_sales_employess_id FOREIGN KEY(employee_id) REFERENCES employees(id),
    CONSTRAINT fk_sales_customers_id FOREIGN KEY(customer_id) REFERENCES customers(id),
    CONSTRAINT fk_sales_calendar_id FOREIGN KEY(calendar_id) REFERENCES calendar(id)
);