use world;

show tables;

-- 주석

-- 테이블 생성
create table member (
	seq int,
    name varchar(100),
    id varchar(100),
    regdate datetime
);

-- 테이블 삭제
drop table member2;
drop table member;

-- 데이터 입력
insert into cafe (
	seq
	, name
	, ttable
	, chair
	, address
	, location
	, ceo
) values (
	2
    , '별다방'
    , 1
    , 2
    , '서울시 어디쯤'
    , 1 
	, '장동건'
);

-- varchar 은 ' 또는 " 로 감싼다.
-- int 는 사용하지 않아도 된다.
-- 컴마는 앞쪽을 선호 : 이건 호불호가 갈린다.

-- 데이터 조회
select * from cafe;
select name, ceo from cafe;

select * from cafe where seq = 3;
select * from cafe where location = 5;
select * from cafe where name = '블루바틀';
select * from cafe where name = '별다방' and ttable = 1 and chair = 2;
select * from cafe where name = '블루바틀' or ceo='장동건';

select * from cafe where location > 5;
select * from cafe where location < 5;
select * from cafe where location >= 5;
select * from cafe where location <= 5;
select * from cafe where location <> 5;

select * from cafe where name like '%루바%';
select * from cafe where name like '루바%';
select * from cafe where name like '%루바';


-- primary key : 유일한 데이터









-- 데이터 삭제

 



