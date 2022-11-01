SELECT authors.au_id AS 'ID AUTHORS', authors.au_lname AS 'LAST NAME',
	   authors.au_fname AS 'FIRST NAME',title AS 'TITLE', publishers.pub_name AS 'PUBLISHERS'
       FROM authors LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
       LEFT JOIN titles ON titleauthor.title_id = titles.title_id
       INNER JOIN publishers ON titles.pub_id = publishers.pub_id;