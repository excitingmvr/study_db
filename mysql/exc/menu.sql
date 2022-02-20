use world;

WITH RECURSIVE CteMenu(ifmuSeq, ifmuParents, pname, ifmuName, d, h, ifmuOrder) AS 
(
    select ifmuSeq, ifmuParents, cast('' as char(31)), ifmuName, 0, cast(ifmuSeq as char(10)), ifmuOrder from infrMenu where ifmuParents is null
    UNION ALL
    select d.ifmuSeq, d.ifmuParents, cte.ifmuName, d.ifmuName, d + 1, concat(cte.h, '-', d.ifmuOrder), d.ifmuOrder from infrMenu d inner join CteMenu cte on d.ifmuParents = cte.ifmuSeq
)
select * from CteMenu order by h;

select ifmuSeq, ifmuParents, cast('' as char(31)), ifmuName, 0, cast(ifmuSeq as char(10)), ifmuOrder from infrMenu where ifmuParents is null;