use nct;

-- 목록
select
	a.ifmmSeq
    , a.ifmmAdminNy
    , a.ifmmDormancyNy
	, a.ifmmName
	, a.ifmmId
    , a.ifmmPwdModDate
    , a.ifmmNickname
    , a.ifmmgenderCd
    ,(select ifcdName from infrCode where ifcdSeq = a.ifmmgenderCd) as ifmmgenderName
    , a.ifmmDob
    , a.ifmmSavedCd
    ,(select ifcdName from infrCode where ifcdSeq = a.ifmmSavedCd) as ifmmSavedName
    , a.ifmmMarriageCd
    ,(select ifcdName from infrCode where ifcdSeq = a.ifmmMarriageCd) as ifmmMarriageName
    , a.ifmmMarriageDate
    , a.ifmmChildrenNum
    , b.ifmaTypeCd
    ,(select ifcdName from infrCode where ifcdSeq = b.ifmaTypeCd) as ifmaTypeName
    , b.ifmaTitle
    , b.ifmaAddress1
    , b.ifmaAddress2
    , b.ifmaZipCode
    , c.ifaoTypeCd
    ,(select ifcdName from infrCode where ifcdSeq = c.ifaoTypeCd) as ifaoTypeName
    , c.ifaoSnsTypeCd
    , ifnull(c.ifaoSnsTypeCd,"-") as ifaoSnsTypeCdNullCheck
    ,(select ifcdName from infrCode where ifcdSeq = c.ifaoSnsTypeCd) as ifaoSnsTypeName
    , c.ifaoTitle
    , c.ifaoUrl
    , d.ifmeTypeCd
    ,(select ifcdName from infrCode where ifcdSeq = d.ifmeTypeCd) as ifmeTypeName
    , d.ifmeEmailFull
    , e.ifjqQuestionCd
    ,(select ifcdName from infrCode where ifcdSeq = e.ifjqQuestionCd) as ifjqQuestionName
    , e.ifjqAnswer
    , f.ifnaSeq
    , g.ifnaName
    , h.ifmpTypeCd
    ,(select ifcdName from infrCode where ifcdSeq = h.ifmpTypeCd) as ifmpTypeName
    , h.ifmpDeviceCd
    ,(select ifcdName from infrCode where ifcdSeq = h.ifmpDeviceCd) as ifmpDeviceName
    , h.ifmpTelecomCd
    ,(select ifcdName from infrCode where ifcdSeq = h.ifmpTelecomCd) as ifmpTelecomName
    , h.ifmpNumber
    , concat(substring(h.ifmpNumber,1,3),"-",substring(h.ifmpNumber,4,4),"-",substring(h.ifmpNumber,7,4)) as ifmpTelecomNameWithDash
    , ifnull(c.ifaoSnsTypeCd,"-") as ifaoSnsTypeCdNullCheck
from 
	infrMember a
	left join infrMemberAddress b on b.ifmaDelNy = 0 and b.ifmaDefaultNy = 1 and b.ifmmSeq = a.ifmmSeq
    left join infrMemberAddressOnline c on c.ifaoDelNy = 0 and c.ifaoDefaultNy = 1 and c.ifmmSeq = a.ifmmSeq
    left join infrMemberEmail d on d.ifmeDelNy = 0 and d.ifmeDefaultNy = 1 and d.ifmmSeq = a.ifmmSeq
    left join infrMemberJoinQna e on e.ifjqDelNy = 0 and e.ifmmSeq = a.ifmmSeq
    left join infrMemberNationality f on f.ifmnDelNy = 0 and f.ifmnDefaultNy = 1 and f.ifmmSeq = a.ifmmSeq
		left join infrNationality g on g.ifnaDelNy = 0 and g.ifnaSeq = f.ifnaSeq
	left join infrMemberPhone h on h.ifmpDelNy = 0 and h.ifmpDefaultNy = 1 and h.ifmmSeq = a.ifmmSeq
where 1=1
	and a.ifmmDelNy = 0
    -- and a.ifmmId like '%xd%'
    -- 이름 검색
    -- 가입일 검색
    -- 이메일동의 여부
    -- 이메일 검색
	-- and b.ifmaTypeCd = 46
    -- and c.ifaoSnsTypeCd = 37
    -- and a.ifmmSeq = 2
;


-- 아이디 중복 체크
select 
	count(ifmmid)
from 
	infrMember a
where 1=1
	and a.ifmmDelNy = 0
    and a.ifmmId = 'xdmin'
;

-- 아이디검색
select 
	a.ifmmId
    , a.ifmmName
from 
	infrMember a
    left join infrMemberEmail b on b.ifmeDelNy = 0 and b.ifmeDefaultNy = 1 and b.ifmmSeq = a.ifmmSeq
where 1=1
	and a.ifmmDelNy = 0
    and a.ifmmName = '전체관리자'
    and b.ifmeEmailFull = 'asdf@asdf.com'
;

-- 
select * from infrMember;
select * from infrMemberEmail;


--     ,(
-- 		case
-- 			when a.ifmmgenderCd = 3 then '남성'
--             when a.ifmmgenderCd = 4 then '여성'
--             when a.ifmmgenderCd = 5 then '기타'
--         end 
-- 		) as ifmmgenderNameCase 

use nct;

select
	a.ifcgSeq 
	, a.ifcgName
	, b.ifcdSeq
	, b.ifcdName
	, b.ifcdOrder
	, b.ifcdUseNy
	, b.ifcdDelNy
from infrCodeGroup a
	left join infrCode b on b.ifcgSeq = a.ifcgSeq
where 1=1
	and a.ifcgDelNy = 0
    and a.ifcgUseNy = 1
	and b.ifcdDelNy = 0
	and b.ifcdUseNy = 1
    -- and a.ifcgSeq = 3
order by 
	a.ifcgSeq asc
    -- a.ifcgSeq desc
    , b.ifcdOrder
    -- , b.ifcdOrder desc
;

select * from infrCode 
;



