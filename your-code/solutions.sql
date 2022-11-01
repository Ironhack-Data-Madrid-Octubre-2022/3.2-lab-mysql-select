select a.au_id, a.au_lname,a.au_fname, title ,pub_name 
from authors as a
left join titleauthor
on a.au_id=titleauthor.au_id
left join titles 
on titleauthor.title_id=titles.title_id
left join publishers
on  titles.pub_id=publishers.pub_id
where pub_name is not null
SELECT a.au_id , a.au_lname , a.au_fname ,
publishers.pub_name , count(titles.title)
FROM authors as a
LEFT JOIN titleauthor
ON a.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
LEFT JOIN publishers
ON titles.pub_id=publishers.pub_id
WHERE pub_name IS NOT NULL
GROUP BY a.au_id,publishers.pub_name;

SELECT a.au_id as "AUTHOR ID", a.au_lname  as "LAST NAME", a.au_fname as "FIRST NAME" , sum(sales.qty) as "TOTAL"

FROM authors as a
LEFT JOIN titleauthor
ON a.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
LEFT JOIN sales
ON titles.title_id=sales.title_id
WHERE title IS NOT NULL
GROUP BY a.au_id
order by total desc limit 3;

SELECT a.au_id as "AUTHOR ID", a.au_lname  as "LAST NAME", a.au_fname as "FIRST NAME" , ifnull(sum(sales.qty),0) as "TOTAL"
FROM authors as a
LEFT JOIN titleauthor
ON a.au_id=titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id=titles.title_id
LEFT JOIN sales
ON titles.title_id=sales.title_id
GROUP BY a.au_id
order by total desc;