
#CHALLENGE 1

select ta.au_id,a.au_fname,a.au_lname,t.title,p.pub_name from titleauthor as ta
left join authors as a
on ta.au_id=a.au_id
left join titles as t
on ta.title_id=t.title_id
left join publishers as p
on t.pub_id=p.pub_id;

#CHALLENGE 2

select a.au_id, a.au_fname, a.au_lname, p.pub_name, count(ta.title_id)
from authors as a
left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on ta.title_id=t.title_id
left join publishers as p   #si pongo inner no me salen los null de publishers
on t.pub_id=p.pub_id
group by a.au_id,p.pub_id
order by  count(ta.title_id) desc;

#CHALLENGE 3

select a.au_id,a.au_fname,a.au_lname,count(t.title )
from authors as a
left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on ta.title_id=t.title_id
group by a.au_id
order by count(t.title) desc limit 3;


#CHALLENGE 4

select a.au_id,a.au_fname,a.au_lname,count(t.title )
from authors as a
left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on ta.title_id=t.title_id
group by a.au_id
order by count(t.title) desc ; 
