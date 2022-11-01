-- CHALLENGE 1: Who Have Published What At Where?


create table if not exists newtable
select  authors.au_id as AUTHORS, au_lname as LAST_NAME, au_fname as FIRST_NAME, titles.title as TITLE, pub_name as PUBLISHER
from publishers
inner join titles on publishers.pub_id = titles.pub_id
inner join titleauthor on titleauthor.title_id = titles.title_id
inner join authors on titleauthor.au_id = authors.au_id;


-- Table inspector verifica que newtable y titleauthor tienen 25 filas



-- CHALLENGE 2: Who Have Published How Many At Where?

select *, count(newtable.TITLE) as TITLE_COUNT
from newtable
group by newtable.TITLE;

-- Comprobamos

select newtable.TITLE, count(newtable.TITLE) as TITLE_COUNT
from newtable;

-- Son 25 recuentos, igual que en titleauthor


-- CHALLENGE 3: Best Selling Authors


select AUTHORS, LAST_NAME, FIRST_NAME, count(newtable.TITLE) as TOTAL
from newtable
group by newtable.AUTHORS
order by total desc limit 3;


-- CHALLENGE 3: Best Selling Authors Ranking

create table if not exists newtable2
select *, count(newtable.TITLE) as TOTAL
from newtable
group by newtable.AUTHORS
order by total desc;



select * from newtable2 where TOTAL is null;


-- No hay nulos

select AUTHORS, LAST_NAME, FIRST_NAME, TOTAL 
from newtable2


