CREATE TABLE order_contacts(
    ID int PRIMARY KEY,
    name varchar(255) not null,
    email varchar(255) not null,
    phone varchar(255) not null,
    phone2 varchar(255),
    order_id uint2
)INHERITS(gorm_model);