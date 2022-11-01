-- Challenge 1 - Who Have Published What At Where?

create table if not exists tabla
select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, p.pub_name as PUBLISHERS
from publishers as p
left join titles as t
on p.pub_id = t.pub_id
left join titleauthor as l
on t.title_id = l.title_id
left join authors as a
on l.au_id = a.au_id;


-- Challenge 2 - Who Have Published How Many At Where?

select *,
count(tabla.TITLE) as TITLE_COUNT
from tabla
group by tabla.TITLE
order by TITLE_COUNT desc;

-- Challenge 3 - Best Selling Authors

create table tabla2
select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, 
a.au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
from sales
left join titleauthor as l
on sales.title_id = l.title_id
left join authors as a
on l.au_id = a.au_id
group by AUTHOR_ID
order by TOTAL desc limit 3;

-- Challenge 4 - Best Selling Authors Ranking

create table tabla3
select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, 
a.au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
from sales
left join titleauthor as l
on sales.title_id = l.title_id
left join authors as a
on l.au_id = a.au_id
group by AUTHOR_ID
order by TOTAL desc;

select * from tabla3;


