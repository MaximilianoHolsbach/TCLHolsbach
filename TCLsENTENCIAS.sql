use chaco_print_3;

-- Primer transacción, comenzamos utilizando la tabla cliente. 
 
start transaction;

delete from cliente 
where fecha < '1991-01-01';

select * from cliente 
order by fecha asc 
limit 10;

-- rollback

-- commit

insert into cliente(id_cliente,nombre,cuit,fecha)
value
('21','HERRERA MARTIN ALEJANDRO', '50876683','1990-05-25 00:00:00'),
('3','MUNICIPALIDAD DE PTO EVA PERON', '48122802','1990-11-23 00:00:00'),
('68','VILLAVERDE JUAN MATIAS', '40019701','1990-11-27 00:00:00');

-- ########################################################################################

-- Segunda transacción, utilizamos la tabla stock

start transaction;

insert into stock(id_producto,nombre,precio,cantidad,cantidad_minima,proveedor)
value
('830017','PAPEL BOND 90GR. 0.61X50MTS. PLATINUM',64.8034,35,51,10),
('830020','PAPEL BOND 90GR. 0.91X45MTS.',45.0074,169,95,10),
('830025','PAPEL BOND 90GR. 1.07X45MTS. INKJET',39.135,118,51,10),
('841280','TONER RICOH MPC2030/2550/2551/9125 NEGRO 841500',58.3798,165,74,5);
savepoint lote_1;
insert into stock(id_producto,nombre,precio,cantidad,cantidad_minima,proveedor)
value
('841281','TONER RICOH MPC2030/2550/2551/9125 CYAN 841503',290.1064,47,60,5),
('841282','TONER RICOH MPC2030/2550/2551/9125 MAGENTA 84150',2290.1064,177,19,5),
('841283','TONER RICOH MPC2030/2550/2551/9125 AMARILLO 841501',290.1064,34,66,5),
('841333','TONER RICOH AF3260/5560 BLACK',69.6084,47,92,5);
savepoint lote_2;

-- release savepoint lote_1;

select * from stock 
order by cod_interno desc 
limit 10;