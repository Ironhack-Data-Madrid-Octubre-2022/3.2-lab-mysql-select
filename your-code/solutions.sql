select a.au_id as 'AUTHOR ID', a.au_fname as 'LAST NAME', a.au_lname as 'FIRST NAME', t.title as 'TITLE' ,  p.pub_name as 'PUBLISHER' 
from authors as a
left join titleauthor as ta
ON ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id

---

select a.au_id as 'AUTHOR ID',a.au_fname as 'LAST NAME', a.au_lname as 'FIRST NAME', p.pub_name as 'PUBLISHER',
       COUNT(t.title)
       
from authors as a
left join titleauthor as ta
ON ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
inner join publishers as p
on t.pub_id = p.pub_id
group by p.pub_name, a.au_id;
      
---

select a.au_id as 'ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', sum(s.qty) as 'QUANTITY'

from authors as a
left join titleauthor as ta
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
inner join sales as s
on ta.title_id = s.title_id
group by a.au_id
order by quantity desc limit 3

---


