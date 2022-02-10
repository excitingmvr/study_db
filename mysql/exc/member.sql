select
	a.ifmmSeq
    , a.ifmmAdminNy
    , a.ifmmDormancyNy
	, a.ifmmName
	, a.ifmmId
    , b.ifmaTypeCd
    ,(select ifcdName from infrCode where ifcdSeq = b.ifmaTypeCd) as ifmaTypeName
    , b.ifmaTitle
    , b.ifmaAddress1
    , b.ifmaAddress2
    , b.ifmaZipCode
    , c.ifaoTypeCd
    ,(select ifcdName from infrCode where ifcdSeq = c.ifaoTypeCd) as ifaoTypeName
    , c.ifaoSnsTypeCd
    ,(select ifcdName from infrCode where ifcdSeq = c.ifaoSnsTypeCd) as ifaoSnsTypeName
    , c.ifaoTitle
    , c.ifaoUrl
from 
	infrMember a
	left join infrMemberAddress b on b.ifmaDelNy = 0 and b.ifmaDefaultNy = 1 and b.ifmmSeq = a.ifmmSeq
    left join infrMemberAddressOnline c on c.ifaoDelNy = 0 and c.ifaoDefaultNy = 1 and c.ifmmSeq = a.ifmmSeq
where 1=1
	and a.ifmmDelNy = 0
	-- and ifmaTypeCd = 46
    -- and ifaoSnsTypeCd = 37
    -- and a.ifmmSeq = 2
;


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
    -- , b.ifcdOrder
    , b.ifcdOrder desc
;

select * from infrCode 
;


-- ifcdSeq 128 이상으로 커질 수 있다.
-- 

title, context, writter, hit
reply 
