use publications;

CHALLENGE 1

SELECT a.au_id AS "AUTHOR ID" , a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", 
titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
FROM authors as a

LEFT JOIN titleauthor 
ON a.au_id=titleauthor.au_id

LEFT JOIN titles
ON titleauthor.title_id=titles.title_id

LEFT JOIN publishers
ON titles.pub_id=publishers.pub_id

WHERE pub_name IS NOT NULL;


CHALLENGE 2

SELECT a.au_id AS "AUTHOR ID" , a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", 
publishers.pub_name AS "PUBLISHER", count(titles.title) AS "TITLE COUNT"
FROM authors as a

LEFT JOIN titleauthor 
ON a.au_id=titleauthor.au_id

LEFT JOIN titles
ON titleauthor.title_id=titles.title_id

LEFT JOIN publishers
ON titles.pub_id=publishers.pub_id

WHERE pub_name IS NOT NULL

GROUP BY a.au_id,publishers.pub_name;


CHALLENGE 3

SELECT a.au_id AS "AUTHOR ID" , a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", sum(sales.qty) AS "TOTAL" 
FROM authors as a

LEFT JOIN titleauthor 
ON a.au_id=titleauthor.au_id

LEFT JOIN titles
ON titleauthor.title_id=titles.title_id

LEFT JOIN sales 
ON titles.title_id=sales.title_id

WHERE qty IS NOT NULL

GROUP BY a.au_id

ORDER BY TOTAL DESC

LIMIT 3;


CHALLENGE 4

SELECT a.au_id AS "AUTHOR ID" , a.au_lname AS "LAST NAME", a.au_fname AS "FIRST NAME", COALESCE(sum(sales.qty),0) AS "TOTAL" 
FROM authors as a

LEFT JOIN titleauthor 
ON a.au_id=titleauthor.au_id

LEFT JOIN titles
ON titleauthor.title_id=titles.title_id

LEFT JOIN sales 
ON titles.title_id=sales.title_id

GROUP BY a.au_id

ORDER BY TOTAL DESC;