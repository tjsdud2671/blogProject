show tables;
create table board(
	idx int not null auto_increment,		/*게시글 고유번호*/
	mid varchar(30) not null,				/*작성자 아이디*/
	nick varchar(30) not null,				/*작성자 닉네임*/
	title varchar(50) not null,				/*글제목*/
	content text not null,					/*내용*/
	fName varchar(200),						/*업로드시의 파일명*/
	fSName	 varchar(200),					/*실제 파일서버에 저장되는 파일명 */
	readNum int not null default 0,			/*조회수*/
	openSw char(2) default 'OK',			/*게시글 공개여부(OK:공개, NO:비공개)*/
	wDate datetime default now(),			/*글 올린 날짜(시간)*/
	good int default 0,						/*좋아요 수*/
	primary key(idx)
);

drop table board;

create table boardReply(
	idx int not null auto_increment,		/*댓글 고유번호*/
	boardIdx int not null,					/*게시글 고유번호*/
	mid varchar(30) not null,				/*댓글 작성자 아이디*/
	nick varchar(30) not null,				/*댓글 작성자 닉네임*/
	wDate datetime default now(),			/*댓글 업로드 날짜*/
	content text not null,					/*댓글 내용*/
	primary key(idx)						
);
drop table boardReply;



