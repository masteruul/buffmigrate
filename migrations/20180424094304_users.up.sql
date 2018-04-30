CREATE TABLE users(
  ID int PRIMARY KEY,
  email varchar(255) unique,
  password varchar(255),
  name varchar(255),
  role varchar(255),
  confirm_token varchar(255),
  confirmed boolean
)INHERITS(gorm_model);
