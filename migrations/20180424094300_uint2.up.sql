CREATE DOMAIN uint2 AS int4
   CHECK(VALUE >= 0 AND VALUE < 65536);

