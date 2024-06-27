show tables;

create table admin(
	idx int not null auto_increment primary key,	/*게시글 고유번호*/
	fName varchar(200),								/*업로드 파일명*/						
	fSName varchar(200),							/*실제 파일서버에 저장되는 파일명*/	
	content text not null							/*내용*/
);