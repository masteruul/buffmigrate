CREATE TABLE order_Items(
    ID int PRIMARY KEY,
    pnr varchar(255),
    booking_code varchar(255),
    fare int,
    agent_fare int,
    baggage varchar(255),
    insurance int,
    agent_insurance int,
    order_id uint2
)INHERITS(gorm_model);
