select * from infrCate;

WITH RECURSIVE CteCate(ifctSeq, ifctParents, ParentsName, ifctName, depth, orderString, ifctOrder, ifctDepth) AS 
(
    select ifctSeq, ifctParents, cast('' as char(30)), ifctName, 0, cast(ifctSeq as char(10)), ifctOrder, ifctDepth from infrCate where ifctParents is null
    UNION ALL
    select d.ifctSeq, d.ifctParents, cte.ifctName, d.ifctName, depth + 1, concat(cte.orderString, '-', d.ifctOrder), d.ifctOrder, d.ifctDepth from infrCate d inner join CteCate cte on d.ifctParents = cte.ifctSeq
)
select * from CteCate order by orderString;

select * from infrCate where ifctDepth = 2 and ifctParents=4;


 select ifctSeq, ifctParents, cast('' as char(30)), ifctName, 0, cast(ifctSeq as char(10)), ifctOrder, ifctDepth from infrCate where ifctParents is null;
 
 select d.ifctSeq, d.ifctParents, cte.ifctName, d.ifctName, depth + 1, concat(cte.orderString, '-', d.ifctOrder), d.ifctOrder, d.ifctDepth from infrCate d inner join CteCate cte on d.ifctParents = cte.ifctSeq;