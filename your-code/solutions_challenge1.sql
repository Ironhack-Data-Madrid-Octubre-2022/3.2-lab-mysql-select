select au.au_id as 'AUTHOR_ID', au.au_lname as 'LAST_NAME', au.au_fname as 'FIRST_NAME', t.title as 'TITLE', p.pub_name as 'PUBLISHER'
from authors as au
left join titleauthor as ta
on au.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as p
on t.pub_id = p.pub_id