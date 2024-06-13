drop table if exists Item;
create table Item (
ItemID varchar(4) not null,
ItemDescription varchar(15) not null,
ItemPrice decimal(4,2) not null,
ItemOnHand varchar(2) not null, 
SuppID varchar(1) not null,
primary key(ItemID));

insert into Item values('1001', 'Lamp', '15.00', '10', '1');
insert into Item values('1002', 'Shoes', '30.00', '5', '3');
insert into Item values('1003', 'Shirt', '20.00', '12', '2');
insert into Item values('1004', 'Table', '50.00', '13', '4');
insert into Item values('1005', 'Socks', '5.00', '20', '2');
select * from Item;