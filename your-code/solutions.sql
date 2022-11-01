-- CHALLENGE 1:
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
 titles.title AS 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM titleauthor
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id;

SELECT * FROM titleauthor -- (PARA COMPROBAR LAS FILAS)
    -- MISMAS FILAS LAS DOS TABLAS == OK


-- CHALLENGE 2: 

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
 publishers.pub_name as 'PUBLISHER', count(titles.title) as 'TITLE COUNT'
 
from titleauthor

left join authors
on titleauthor.au_id = authors.au_id

left join titles
on titleauthor.title_id = titles.title_id

left join publishers
on titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id;

-- CHALLENGE 3:

select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME' ,authors.au_fname as 'FIRST NAME',
 sum(sales.qty) as 'TOTAL'
 FROM authors
 
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN titles
ON titleauthor.title_id = titles.title_id

LEFT JOIN sales
on titles.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- CHALLENGE 4:
select authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME' ,authors.au_fname as 'FIRST NAME', 
ifnull (sum(sales.qty), 0) as 'TOTAL'

FROM authors

LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN titles
ON titleauthor.title_id = titles.title_id

LEFT JOIN sales
on titles.title_id = sales.title_id

GROUP BY authors.au_id
ORDER BY TOTAL DESC;

