USE retail_sales_analysis;

LOAD DATA LOCAL INFILE 'E:/Data Science Classes/archive/ecommerce_dataset_10000.csv'
INTO TABLE ecommerce_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    customer_id,
    first_name,
    last_name,
    gender,
    age_group,
    signup_date,
    country,
    product_id,
    product_name,
    category,
    quantity,
    unit_price,
    order_id,
    order_date,
    order_status,
    payment_method,
    rating,
    review_text,
    review_id,
    review_date
);