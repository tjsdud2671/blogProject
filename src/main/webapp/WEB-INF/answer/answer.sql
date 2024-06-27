create table answer(
	idx int not null auto_increment,		/*답변 고유번호*/
	content text not null,					/*답변 내용*/
	nick varchar(30) not null,				/*작성자 닉네임*/
	primary key(idx)
);