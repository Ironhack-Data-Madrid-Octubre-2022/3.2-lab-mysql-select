SELECT a.au_id AS "AUTHOR ID" ,
       a.au_lname AS 'LAST NAME', 
       a.au_fname AS "FIRST NAME",
	   t.title AS 'TITLE',
       p.pub_name AS 'PUBLISHERS'
FROM authors a
LEFT JOIN titleauthor ta
ON ta.au_id = a.au_id
LEFT JOIN titles t
ON t.title_id = ta.title_id
INNER JOIN publishers p
ON p.pub_id = t.pub_id
;

SELECT a.au_id AS "AUTHOR ID" , a.au_lname AS 'LAST NAME', a.au_fname AS "FIRST NAME",
       group_concat(t.title) as "TITLE",
       p.pub_name AS 'PUBLISHERS',
       COUNT(t.title) "TITLE COUNT"
FROM authors a
LEFT JOIN titleauthor ta
ON ta.au_id = a.au_id
LEFT JOIN titles t
ON t.title_id = ta.title_id
INNER JOIN publishers p
ON p.pub_id = t.pub_id
GROUP BY p.pub_name, a.au_id
;

SELECT a.au_id 'AUTHOR ID', a.au_fname 'FIRST NAME', a.au_lname 'LAST NAME', sum(s.qty) 'TOTAL'
FROM authors a 
LEFT JOIN titleauthor ta
ON ta.au_id = a.au_id
INNER JOIN sales s
ON s.title_id = ta.title_id
GROUP BY a.au_id 
ORDER BY TOTAL DESC LIMIT 3
;

SELECT a.au_id 'AUTHOR ID', a.au_fname 'FIRST NAME', a.au_lname 'LAST NAME', coalesce(sum(s.qty)) 'TOTAL'
FROM authors a 
LEFT JOIN titleauthor ta
ON ta.au_id = a.au_id
INNER JOIN sales s
ON s.title_id = ta.title_id
GROUP BY a.au_id 
ORDER BY TOTAL DESC 
;
