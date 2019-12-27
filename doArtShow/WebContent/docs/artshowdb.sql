create user 'artmaster'@'localhost'
identified  by '1111';

create user 'artmaster'@'%'
identified  by '1111';

create database artshowdb
default character set utf8
collate utf8_general_ci;



grant all privileges on artshowdb.* 
to 'artmaster'@'localhost'
with grant option;

grant all privileges on artshowdb.* 
to 'artmaster'@'%'
with grant option;

use artshowdb;


create table artshowdb.member (
id		varchar(30)  not null primary key, -- 아이디
email	varchar(50)  not null, -- 이메일
name	varchar(10)  not null, -- 이름
pw		varchar(30)  not null, -- 비밀번호
myImg	varchar(100) default 'default.jpg'  -- 프로필 사진
) default character set utf8 collate utf8_general_ci;

insert into artshowdb.member(id, email, name, pw) values('jungmi0008', 'jungmi0008@naver.com','기리링','Qp2ql134!');

select * from artshowdb.member;

