use world;

CREATE TABLE IF NOT EXISTS `world`.`book5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `world`.`review5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `book5_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`, `book5_no`),
  INDEX `fk_review_copy1_book51_idx` (`book5_no` ASC) VISIBLE,
  CONSTRAINT `fk_review_copy1_book51`
    FOREIGN KEY (`book5_no`)
    REFERENCES `world`.`book5` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 1	이것이자바다	1
-- 2	프로그래밍가이드북	
-- 3	안드로이드	3
-- 4	4차산업혁명의미래	4

desc book5;

insert into book5 (
name
) values (
'sqlplus'
);

select * from book5;

insert into review5 (
comment
, book5_no  
) values (
'우와 책 재미 있습니다.'
, 4
);

-- Error Code: 1364. Field 'book5_no' doesn't have a default value


select * from review5;

-- 점선 : nonidentifying : 부모자식관계 : 개발하기 좀 불편하다
-- 실선 : identifying : ???? : 개발용이성 높다

desc review5;

select 
a.name
, (select count(no) from review5 where book5_no = a.no) as count
from book5 a
;

select 
a.no
, a.name
, b.book5_no
, b.comment
from book5 a
-- left join review5 b on b.book5_no = a.no
inner join review5 b on b.book5_no = a.no
;

desc review5;

select
	a.comment
	,b.name
from review5 a
left join book5 b on b.no = a.book5_no
;
