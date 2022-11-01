-- Challenge 1

select a.au_id, au_lname, au_fname, title, pub_name
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id;

-- Challenge 2

select a.au_id, au_lname, au_fname, pub_name, count(title) titleCount
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id
group by a.au_id, pub_name
order by titleCount desc;

-- Challenge 3

select a.au_id, a.au_lname, au_fname, sum(qty) total
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join sales as s
on ta.title_id = s.title_id
group by au_id
order by total desc
limit 3;

-- Challenge 4

select a.au_id, a.au_lname, au_fname, ifNull(sum(qty), 0) as total
from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join sales as s
on ta.title_id = s.title_id
group by au_id
order by total desc