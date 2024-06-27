show tables;
create table neighbor(
	myNick varchar(30) not null, 
	friendNick varchar(30) not null /*이웃 닉네임*/
);

drop table neighbor;