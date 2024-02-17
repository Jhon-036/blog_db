create table users(
	id serial primary key,
	first_name varchar(25),
	last_name varchar(25),
	email varchar(50)
)

create table posts(
	id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text text 
)

create table likes(
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
)

insert into users (first_name, last_name, email) values 
('Luis', 'Sánchez', 'lsanchez@gmail.com'),
('Victor', 'Ávila', 'vavila@gmail.com'),
('Jorge', 'Castro', 'jcastro@gmail.com')

insert into posts (creator_id, title, text) values 
(1, 'Post_1', 'Lorem ipsum dolor sit amet.'),
(2, 'Post_2', 'Aliquam vestibulum maximus aliquam.'),
(3, 'Post_3', 'Vivamus suscipit lobortis dictum.'),
(1, 'Post_4', 'Nunc non magna eu mi volutpat feugiat.'),
(2, 'Post_5', 'Nam pellentesque quis urna at porta.')

insert into likes (user_id, post_id) values 
(1,1),
(1,2),
(2,3),
(3,4),
(2,5)

select posts.id, posts.text, users.first_name || ' ' || users.last_name
from posts
join users on creator_id = users.id

select posts.id, posts.title, posts.text, users.first_name || ' ' || users.last_name
from posts
join users on creator_id = users.id
where posts.id IN (SELECT post_id FROM likes)

select * from likes