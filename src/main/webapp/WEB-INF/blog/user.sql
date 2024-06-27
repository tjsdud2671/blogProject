show tables;
drop table user;
create table user(
	idx int auto_increment primary key,
	mid varchar(30) not null,
	pwd varchar(100) not null,
	name varchar(10) not null,
	nick varchar(20) not null,
	gender char(2) not null default '여자',
	email varchar(50) not null,
	tel varchar(15),
	level int default 1,
	unique(mid)
);

