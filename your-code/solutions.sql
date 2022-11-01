#CHALLENGE 1

select authors.au_id, au_lname, au_fname, title, pub_name 
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id;

#CHALLENGE 2

select authors.au_id, au_lname, au_fname, pub_name, count(title) from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
group by pub_name, authors.au_id 
order by count(title) desc;

#CHALLENGE 3

select authors.au_id, au_lname, au_fname, sum(qty) as total
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id 
order by total desc
limit 3;

#CHALLENGE 4;

select authors.au_id, au_lname, au_fname, ifnull(sum(qty),0) as total
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id 
order by total desc;