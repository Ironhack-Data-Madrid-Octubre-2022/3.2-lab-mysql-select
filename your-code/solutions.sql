select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name 
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on t.title_id = ta.title_id
left join publishers as p
on t.pub_id = p.pub_id
where t.title is not null;

select a.au_id, a.au_lname, a.au_fname, p.pub_name , count(p.pub_name)  
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on t.title_id = ta.title_id
left join publishers as p
on t.pub_id = p.pub_id
where t.title is not null
group by a.au_id;

select a.au_id, a.au_lname,au_fname, sum(t.ytd_sales) as TOTAL
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on t.title_id = ta.title_id
where t.title is not null
group by a.au_id
order by TOTAL desc
limit 3;
UPDATE titles
SET ytd_sales=0
WHERE ytd_sales IS NULL;

create temporary table update2 as
select a.au_id, a.au_lname,au_fname, sum(t.ytd_sales) as TOTAL
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on t.title_id = ta.title_id

group by a.au_id
order by TOTAL desc
;
UPDATE update2
SET TOTAL=0
WHERE TOTAL IS NULL;
