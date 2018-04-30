CREATE TABLE passengers(
    ID int PRIMARY KEY,
    title varchar(255),
    name varchar(255),
    type varchar(255),
    id_number varchar(255),
    birth_date date,
    passport_id int not null,
    user_id uint2
)INHERITS(gorm_model);
