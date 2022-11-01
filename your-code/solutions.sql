-- CHALLENGE 1

select au.au_id as 'AUTHOR _ID', au.au_lname as 'LAST_NAME', au.au_fname as 'FIRST_NAME', t.title as'TITLE',pub.pub_name as 'PUBLISHER'

From authors as au 
left join titleauthor as ta -- titleauthor me lo llevo a author
on au.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

inner join publishers as pub
on pub.pub_id = t.pub_id

order by au.au_id


-- CHALLENGE 2

select `AUTHOR _ID`,LAST_NAME,FIRST_NAME,TITLE,PUBLISHER, COUNT(*) AS TITLE_COUNT
FROM challenge_1
GROUP BY `AUTHOR _ID`,PUBLISHER
ORDER BY `AUTHOR _ID` DESC;

-- CHALLENGE 3 -- 

SELECT au.au_id as 'AUTHOR_ID', au.au_lname as 'LAST_NAME', au.au_fname as 'FIRST_NAME', t.title as'TITLE', sum(qty) as 'TOTAL SOLD'

from authors as au

left join titleauthor as ta 
on au.au_id = ta.au_id

left join titles as t
on ta.title_id = t.title_id

left join sales as s
on t.title_id = s.title_id

group by `AUTHOR_ID`
order by 'TOTAL SOLD' ASC
limit 3



