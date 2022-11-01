Challenge 1 - Who Have Published What At Where?

select a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name as 'PUBLISHERS'
from titles t
left join titleauthor ta
on ta.title_id=t.title_id
left join authors a
on a.au_id=ta.au_id
left join publishers p
on p.pub_id=t.pub_id
where a.au_id is not null;



Challenge 2 - Who Have Published How Many At Where?

select a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', 
		t.title AS 'TITLE', p.pub_name as 'PUBLISHERS', count(*)
from titles t
left join titleauthor ta
on ta.title_id=t.title_id
left join authors a
on a.au_id=ta.au_id
left join publishers p
on p.pub_id=t.pub_id
where a.au_id is not null
group by a.au_id;



Challenge 3 - Best Selling Authors

select a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', 
		sum(s.qty) AS 'TOTAL'
from titles t
left join titleauthor ta
on ta.title_id=t.title_id
left join authors a
on a.au_id=ta.au_id
left join sales s
on t.title_id=s.title_id
where a.au_id is not null
group by a.au_id
order by total desc
limit 3;



Challenge 4 - Best Selling Authors Ranking
select a.au_id as 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', 
		coalesce(sum(s.qty),0) AS 'TOTAL'
from titles t
left join titleauthor ta
on ta.title_id=t.title_id
left join authors a
on a.au_id=ta.au_id
left join sales s
on t.title_id=s.title_id
where a.au_id is not null
group by a.au_id
order by total desc;
