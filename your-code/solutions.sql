-- Challenge 1:
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name FROM authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id;

-- Challenge 2:
SELECT authors.au_id, authors.au_lname, authors.au_fname, COUNT(titles.title), publishers.pub_name 
FROM authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
inner join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id,publishers.pub_id
order by COUNT(titles.title) desc;

-- Challenge 3:
select authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as total
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join sales
on titleauthor.title_id = sales.title_id
group by au_id
order by total desc
limit 3;

-- Challenge 4:
select authors.au_id, authors.au_lname, authors.au_fname, IFNULL(sum(sales.qty), 0) as total
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join sales
on titleauthor.title_id = sales.title_id
group by au_id
order by total desc;
