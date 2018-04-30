CREATE TABLE order_passengers(
    ID int PRIMARY KEY,
    title varchar(255) not null,
    name varchar(255) not null,
    type varchar(255) not null,
    ktp varchar(255),
    birth_date date,
    parent uint2,
    order_id uint2,
    user_id uint2
)INHERITS(gorm_model);