ALTER TABLE passengers DROP constraint userid_fk;
ALTER TABLE passports DROP constraint passenger_id_fk;
ALTER TABLE trips DROP constraint orderitemid_fk;
ALTER TABLE order_items DROP constraint orderid_fk;
ALTER TABLE order_passengers DROP constraint orderid_fk;
ALTER TABLE orders DROP constraint contact_id_fk;
ALTER TABLE orders DROP constraint payment_method_fk;
ALTER TABLE orders DROP constraint user_id_fk;