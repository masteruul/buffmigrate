ALTER TABLE passengers ADD constraint userid_fk foreign key (user_id) references users(id); 
ALTER TABLE passports ADD constraint passenger_id_fk foreign key (passenger_id) references passengers(id);
ALTER TABLE trips ADD constraint orderitemid_fk foreign key (order_item_id) references order_items(id);
ALTER TABLE order_items ADD constraint orderid_fk foreign key (order_id) references orders(id);
ALTER TABLE order_passengers ADD constraint orderid_fk foreign key (order_id) references orders(id);
ALTER TABLE orders ADD constraint contact_id_fk foreign key (contact_id) references order_contacts(id);
ALTER TABLE orders ADD constraint payment_method_fk foreign key (payment_method_id) references payment_methods(id);
ALTER TABLE orders ADD constraint user_id_fk foreign key (user_id) references users(id);