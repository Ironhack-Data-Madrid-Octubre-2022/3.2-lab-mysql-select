-----Challenge 1 - Who Have Published What At Where?-------

create temporary table publications.publicaciones_autor

SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors as a LEFT JOIN titleauthor as ta ON ta.au_id = a.au_id
INNER JOIN titles as t ON ta.title_id = t.title_id
LEFT JOIN publishers as p ON p.pub_id = t.pub_id
ORDER BY au_id;


-----Challenge 2 - Who Have Published How Many At Where?-----

Select au_id, au_lname, au_fname, pub_name, COUNT(*) as TITLE_COUNT 
FROM publicaciones_autor
GROUP BY au_id, au_lname, au_fname, pub_name
ORDER BY au_id DESC;


----- Challenge 3 - Best Selling Authors -------

SELECT z.au_id, z.au_lname, z.au_fname, SUM(N_VENTAS) as total
FROM (
SELECT a.au_id, a.au_lname, a.au_fname, t.title_id, s.N_ventas
FROM authors as a LEFT JOIN titleauthor as ta ON ta.au_id = a.au_id
LEFT JOIN titles as t ON ta.title_id = t.title_id 
LEFT JOIN (SELECT title_id, SUM(qty) as N_ventas
FROM SALES
GROUP BY title_id) as s ON ta.title_id = s.title_id
) as z
GROUP BY z.au_id, z.au_lname, z.au_fname
ORDER BY TOTAL DESC
LIMIT 3;


----- Challenge 4 - Best Selling Authors Ranking -------

SELECT z.au_id, z.au_lname, z.au_fname, COALESCE(SUM(N_VENTAS),0) as total
FROM (
SELECT a.au_id, a.au_lname, a.au_fname, t.title_id, s.N_ventas
FROM authors as a LEFT JOIN titleauthor as ta ON ta.au_id = a.au_id
LEFT JOIN titles as t ON ta.title_id = t.title_id 
LEFT JOIN (SELECT title_id, SUM(qty) as N_ventas
FROM SALES
GROUP BY title_id) as s ON ta.title_id = s.title_id
) as z
GROUP BY z.au_id, z.au_lname, z.au_fname
ORDER BY TOTAL DESC;
