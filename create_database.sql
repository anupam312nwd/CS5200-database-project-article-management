
use articles;

insert into users (user_id, fname, lname, username)
values  (1, 'Anupam', 'Kumar', 'anupamkumar'),
        (2, 'John', 'Doe', 'johndoe');

insert into website (website_id, web_address, rating)
values (1, 'https://learnsql.com', 8),
       (2, 'https://www.sqlservercentral.com', 7),
       (3, 'https://medium.com/', 9),
       (4, 'https://www.geeksforgeeks.org/', 8);

insert into author (author_id, author_fname, author_lname)
values (1, 'Dorota', 'Wdzięczna'),
       (2, 'Ambar', 'Kleinbort'),
       (3, 'Nicky', 'Liu'),
       (4, 'Eyal', 'Trabelsi'),
       (5, 'Simon', 'Adams');

insert into article (article_id, article_name, reading_time, web_address, website_id, author_id)
values
    (1, '19 Top SQL Articles for Beginners Published in 2019', '10 min', 'learnsql.com/blog/19-best-sql-articles-for-beginners-published-in-2019/', 1, 1),
    (2, 'Mastering SQL Queries', '15 min', 'https://medium.com/analytics-vidhya/mastering-sql-queries-166e278d9582', 3, 2),
    (3, 'Basics of SQL', '12 min', 'https://medium.com/swlh/basics-of-sql-7f1e72772e63', 3, 3),
    (4, 'Advanced SQL Interview Questions', '20 min', 'https://www.geeksforgeeks.org/advanced-sql-interview-questions/', 4, 5);

insert into article_status(article_id, user_id, status)
values (1, 1, 'read');

insert into author (author_id, author_fname, author_lname)
values (6, 'Belal', 'Khan');

delete from author
where author_id = 6;
