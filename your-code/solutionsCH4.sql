SELECT authors.au_id, au_lname, au_fname, IFNULL(SUM(qty), 0)  
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(qty) DESC
LIMIT 23;