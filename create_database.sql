
use articles;

insert into users (user_id, fname, lname, username)
values  (1, 'Anupam', 'Kumar', 'anupamkumar'),
        (2, 'John', 'Doe', 'johndoe');

insert into website (website_id, web_address, rating)
values (1, 'https://learnsql.com', 8),
       (2, 'https://www.sqlservercentral.com', 7),
       (3, 'https://medium.com/', 9),
       (4, 'https://www.geeksforgeeks.org/', 8),
       (5, 'https://www.arcdigital.media', 10)
       ;

insert into author (author_id, author_fname, author_lname)
values (1, 'Dorota', 'Wdzięczna'),
       (2, 'Ambar', 'Kleinbort'),
       (3, 'Nicky', 'Liu'),
       (4, 'Eyal', 'Trabelsi'),
       (5, 'Simon', 'Adams'),
       (6, 'Megan', 'Brown'),
       (7, 'Liz', 'Vincento'),
       (8, 'Eric', 'Medlin'),
       (9, 'Vishesh', 'Khemani'),
       (10, 'Vaishnavi', 'Vadali');

insert into article (article_id, article_name, reading_time_minute, web_address, website_id, author_id)
values
    (1, '19 Top SQL Articles for Beginners Pubarticlelished in 2019', 10, 'learnsql.com/blog/19-best-sql-articles-for-beginners-published-in-2019/', 1, 1),
    (2, 'Mastering SQL Queries', 15, 'https://medium.com/analytics-vidhya/mastering-sql-queries-166e278d9582', 3, 2),
    (3, 'Basics of SQL', 12, 'https://medium.com/swlh/basics-of-sql-7f1e72772e63', 3, 3),
    (4, 'Advanced SQL Interview Questions', 20, 'https://www.geeksforgeeks.org/advanced-sql-interview-questions/', null, null),
    (5, 'exploring detection events', 10, 'https://towardsdatascience.com/exploring-detection-events-32f1b980bba5', null, null),
    (6, 'Resolve to Abandon Hope and Embrace Groundlessness', 8, 'https://psiloveyou.xyz/this-new-year-resolve-to-abandon-hope-and-embrace-groundlessness-e3c2774e851', 3, 6),
    (7, 'The Arguments Against a Presidential Self Pardon', 7, 'https://evincento.medium.com/pardon-me-sir-but-can-you-do-that-2f266260070d', 3, 7),
    (8, 'The Democrat Brand Problem', 5, 'https://medium.com/politically-speaking/the-democrats-brand-problem-6d57f19f9958', 3, 7),
    (9, 'The Historian and the President', 17, 'https://arcdigital.media/the-historian-and-the-president-4e515e088c90', 5, 8),
    (10, 'Truths, Damned Truths, And Statistics', 25, 'https://vishesh-khemani.medium.com/truths-damned-truths-and-statistics-4bd6602ddc45', 3, 9),
    (11, 'The Web Developer Constant', 3, 'https://medium.com/swlh/the-web-developer-constant-646032a875f2', 3, 10)
    ;

insert into article_status (article_id, user_id, status)
values (2, 1, 'reading'),
       (3, 1, 'unread'),
       (4, 1, 'read'),
       (5, 1, 'unread'),
       (6, 1, 'read'),
       (7, 1, 'reading'),
       (8, 1, 'reading'),
       (9, 1, 'unread'),
       (10, 1, 'unread'),
       (11, 1, 'read')
       ;

insert into review (article_id, user_id, rating, review)
values (1, 1, 8.5, null),
       (2, 1, 9, 'nice article covering overview'),
       (3, 1, 9.5, 'good for beginners'),
       (4, 1, 8, 'nice advanced sql query coverage'),
       (5, 1, 7.5, 'good article for events exploration'),
       (6, 2, 8, 'inspiring and well written'),
       (7, 2, 7.5, 'do not agree with various parts of article'),
       (8, 2, 8.5, 'cover democratic politics'),
       (9, 1, 9, 'overview of history and presidents, nicely written'),
       (10, 1, 7, 'good overlap of statistics and politics')
       ;

insert into tags (article_id, user_id, tags)
values (1, 1, 'sql'),
       (2, 1, 'sql'),
       (3, 1, 'sql'),
       (4, 1, 'advanced sql'),
       (5, 1, 'data science'),
       (6, 2, 'relationship'),
       (7, 2, 'politics'),
       (8, 2, 'politics'),
       (9, 1, 'politics'),
       (10, 1, 'politics')
       ;
