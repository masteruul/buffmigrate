CREATE TABLE orders(
    ID int PRIMARY KEY,
    type int,
    invoice_id varchar(255),
    contact_id int,
    payment_method_id int,
    expired_at timestamp,
    confirmed_at timestamp,
    canceled_at timestamp,
    total_fare int,
    discount int,
    service_fee int,
    final_fare int,
    user_id int 
)INHERITS(gorm_model);