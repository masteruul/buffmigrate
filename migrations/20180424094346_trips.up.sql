CREATE TABLE trips (
  ID int PRIMARY KEY,
  transport_name varchar(255) not null,
  trip_number varchar(255) not null,
  "from" varchar(255) not null,
  "to" varchar(255) not null,
  depart_time timestamp not null,
  arrival_time timestamp not null,
  has_meal boolean,
  order_item_id uint2
)INHERITS(gorm_model);