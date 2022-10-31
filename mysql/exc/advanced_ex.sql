use nct;
-- index

SHOW INDEX FROM infrNationality
;

CREATE INDEX abc ON infrNationality (ifnaDelNy, ifnaName)
;

ALTER TABLE infrNationality DROP INDEX abc
;




create view infrMemberV
as
SELECT a.ifmmSeq ,a.ifmmAdminNy ,a.ifmmDormancyNy ,a.ifmmSocialLoginCd ,a.ifmmName 
,a.ifmmNameEng ,a.ifmmLastName ,a.ifmmFirstName ,a.ifmmLastNameEng ,a.ifmmFirstNameEng ,a.ifmmId 
,a.ifmmPassword ,a.ifmmPwdModDate ,a.ifmmNickname ,a.ifmmGenderCd ,a.ifmmDob ,a.ifmmSavedCd 
,a.ifmmMarriageCd ,a.ifmmMarriageDate ,a.ifmmChildrenNum ,a.ifmmFavoriteColor ,a.ifmmRecommenderSeq 
,a.ifmmEmailConsentNy ,a.ifmmSmsConsentNy ,a.ifmmPushConsentNy ,a.ifmmCountryResidence ,a.ifmmDesc 
,a.ifmmDelNy ,a.regIp ,a.regSeq ,a.regDeviceCd ,a.regDateTime ,a.regDateTimeSvr ,a.modIp ,a.modSeq 
,a.modDeviceCd ,a.modDateTime ,a.modDateTimeSvr ,b.ifmeEmailFull ,c.ifmpNumber FROM infrMember 
a LEFT JOIN infrMemberEmail b ON b.ifmeDelny = 0 AND b.ifmeDefaultNy = 1 AND b.ifmmSeq = a.ifmmSeq 
LEFT JOIN infrMemberPhone c ON c.ifmpDelny = 0 AND c.ifmpDefaultNy = 1 AND c.ifmmSeq = a.ifmmSeq 
WHERE 1=1 AND a.ifmmDelNy = 0 ORDER BY a.ifmmSeq DESC limit 99999999999
;

drop view infrMemberV
;

select * from infrMemberV 
;

--
DELIMITER $$
CREATE FUNCTION getInfrMemberName (
seq bigint
) 
RETURNS varchar(100)
BEGIN
	
    declare rtName varchar(100);

	select
		ifmmName into rtName
	from
		infrMember
	where 1=1
		and ifmmSeq = seq
	;
DEPT
	RETURN rtName;
END$$
DELIMITER ;

select getInfrMemberName(12)
;

SET GLOBAL log_bin_trust_function_creators = 1
;

DELIMITER $$
CREATE trigger xyz (
	
    alter delete
RETURNS varchar(100)
BEGIN
	
    declare rtName varchar(100);

	select
		ifmmName into rtName
	from
		infrMember
	where 1=1
		and ifmmSeq = seq
	;
DEPT
	RETURN rtName;
END$$
DELIMITER ;
