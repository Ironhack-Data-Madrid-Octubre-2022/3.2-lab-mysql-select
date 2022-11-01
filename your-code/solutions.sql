-- 1
select authors.au_id as 'author id', au_lname as 'last name', au_fname as 'first name', t.title as title, pub.pub_name as publisher  
from authors
inner join titleauthor as a
on authors.au_id = a.au_id
left join titles as t
on a.title_id = t.title_id
left join publishers as pub
on t.pub_id = pub.pub_id

-- 2
select authors.au_id as 'author id', au_lname as 'last name', au_fname as 'first name', pub.pub_name as publisher, count(t.title) as 'title count'
from authors
inner join titleauthor as a
on authors.au_id = a.au_id
left join titles as t
on a.title_id = t.title_id
left join publishers as pub
on t.pub_id = pub.pub_id
group by authors.au_id, publisher
order by count(t.title) desc

-- 3
select authors.au_id as 'author id', au_lname as 'last name', au_fname as 'first name', sum(s.qty) as total
from authors
inner join titleauthor as a
on authors.au_id = a.au_id
left join titles as t
on a.title_id = t.title_id
left join sales as s
on a.title_id = s.title_id
group by authors.au_id
order by total desc limit 3

-- 4
select authors.au_id as 'author id', au_lname as 'last name', au_fname as 'first name', coalesce(sum(s.qty), 0) as total
from authors
left join titleauthor as a
on authors.au_id = a.au_id
left join titles as t
on a.title_id = t.title_id
left join sales as s
on a.title_id = s.title_id
group by authors.au_id
order by total desc


