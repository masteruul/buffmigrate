CREATE TABLE passports(
    ID int PRIMARY KEY,
    no varchar(255),
    nationally varchar(255),
    issuing_country varchar(255),
    expiry varchar(255),
    passenger_id uint2
)INHERITS(gorm_model);