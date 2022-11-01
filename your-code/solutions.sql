select a.au_id, a.au_fname, a.au_lname, t.title, p.pub_name from authors a
inner join titleauthor
on a.au_id = titleauthor.au_id
left join titles t
on titleauthor.title_id = t.title_id
left join publishers p
on p.pub_id = t.pub_id;


select a.au_id, a.au_fname, a.au_lname, p.pub_name, count(*) as title_count from authors a
left join titleauthor ti
on a.au_id = ti.au_id
left join titles t
on ti.title_id = t.title_id
left join publishers p
on p.pub_id = t.pub_id
group by p.pub_id, ti.au_id;



select a.au_id, a.au_fname, a.au_lname, sum(s.qty) as total from authors a
left join titleauthor ti
on a.au_id = ti.au_id
left join titles t
on ti.title_id = t.title_id
left join sales s
on s.title_id = ti.title_id
group by a.au_id
order by total desc
limit 3;



select a.au_id, a.au_fname, a.au_lname, sum(ifnull(s.qty,0)) as TOTAL from authors a
left join titleauthor ti
on a.au_id = ti.au_id
left join titles t
on ti.title_id = t.title_id
left join sales s
on s.title_id = ti.title_id
group by a.au_id
order by total desc;


