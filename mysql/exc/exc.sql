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

-- unique, primary key, forien key : 유일한 데이터
-- pk : primary key : 중복되는 데이터는 불허
-- nn: not null : null값을 허용하지 않는다. (데이터가 무조건 들어와야 된다.)
-- uq : 유니크 : 중복되는 데이터는 불허
-- b: 바이너리 파일 저장
-- un : unsigned(?) : 양수만
-- -128 	0	127 : 0 ~ 255
-- -2147483648	0	2147483647
-- zf : zerofill : 5.7 (5,2) -> 00005.7
-- ai : auto increment : 자동증가
-- g: auto increment 의 다른 형태 

-- 테이블 수정
-- 컬럼 추가
alter table test add tel varchar(50);
-- desc test;

-- 컬럼 삭제
alter table test drop tel;

-- 컬럼 타입 변경
alter table test modify tel int;
-- alter table test modify tel varchar(20);
-- desc test;

-- 컬럼 이름 변경
alter table test change tel tele int;
-- alter table test change tele tel int;


insert into test (
	name
    ,tel
) values (
	'Tony'
	,1111
);

select * from test; 
desc test;


-- 데이터 수정
update test set
	name = 'Andrew'
    ,tel = '222'
where 1=1
	and seq = 1;

-- 데이터 삭제
delete from test
where 1=1
	and seq = 3;
  

-- 전체 데이터 삭제
truncate test;

-- DDL : data definition language : db, table 컨트롤 : 주로 관리자, 선임들의 업무
-- DML : data manipulation language : data ; 후임들
-- DCL : data control language : 접근 권한, 커밋/롤백 : 주로 관리자, 개발자, 시스템 의존


