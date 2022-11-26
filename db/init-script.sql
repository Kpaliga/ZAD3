create table Car
(
    id      serial primary key,
    model   varchar(32),
    year    int,
    details text
);

insert into Car (model, "year", details)
values ('BMW e46 compact 2.0 po swapie', 2002, 'details'),
			('Parowóz tomek', 1900, 'details'),
       ('Jeśli Pan to czyta to chce 10/10', 2012, 'details');
