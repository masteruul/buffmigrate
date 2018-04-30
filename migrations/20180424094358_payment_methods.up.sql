CREATE TABLE payment_methods(
    ID int PRIMARY KEY,
    name varchar(255) not null,
    account_number varchar(255),
    acount_owner varchar(255),
    type varchar(255)
)INHERITS(gorm_model);
