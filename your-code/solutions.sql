select authors.au_id, au_lname, au_fname, title, pub_name from authors
left join titleauthor 
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id;

select authors.au_id, au_lname, au_fname, pub_name, count(title) from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
group by pub_name, authors.au_id
order by count(title) desc;

select authors.au_id, au_lname, au_fname, sum(qty) from authors
left join titleauthor 
on authors.au_id = titleauthor.au_id
left join sales
on titleauthor.title_id = sales.title_id
group by authors.au_id
order by count(qty) desc 
limit 3;

select authors.au_id, au_lname, au_fname, Ifnull(sum(qty), 0) 
from authors
left join titleauthor 
on authors.au_id = titleauthor.au_id
left join sales
on titleauthor.title_id = sales.title_id
group by authors.au_id
order by count(qty) desc 
