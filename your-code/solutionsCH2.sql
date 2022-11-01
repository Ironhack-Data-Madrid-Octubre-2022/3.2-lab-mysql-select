SELECT authors.au_id, au_lname, au_fname, pub_name, count(title) 
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY pub_name, authors.au_id ORDER BY count(title) DESC;