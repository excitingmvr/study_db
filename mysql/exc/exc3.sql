use world;

CREATE TABLE IF NOT EXISTS `book4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `review4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `book4_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_review_book4_idx` (`book4_no` ASC) VISIBLE,
  CONSTRAINT `fk_review_book4`
    FOREIGN KEY (`book4_no`)
    REFERENCES `book4` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 1	이것이자바다	1
-- 2	프로그래밍가이드북	
-- 3	안드로이드	3
-- 4	4차산업혁명의미래	4

desc book4;

insert into book4 (
name
) values (
'php'
);

select * from book4;
-- 5

desc review4;

insert into review4 (
comment
, book4_no  
) values (
'우와 책 재미 있습니다.'
, 6
);

select * from review4;

