
-- creating schema for database ---------------------

create database if not exists `kumar_articles`;

use `kumar_articles`;

drop table if exists `users`;

create table `users`(
       `user_id` int not null,
       `fname` varchar(50) not null,
       `lname` varchar(50) not null,
       `username` varchar(100) not null,
       primary key (`user_id`)
);

drop table if exists `administrator`;

create table `administrator`(
       `admin_id` int not null,
       `user_id` int not null,
       primary key (`admin_id`),
       constraint `admin_fk` foreign key (`user_id`) references `users` (`user_id`)
       on update cascade on delete cascade
);

drop table if exists `website`;

create table `website`(
       `website_id` int not null,
       `web_address` varchar(200) not null,
       `rating` float,
       primary key (`website_id`)
);

drop table if exists `author`;

create table `author`(
       `author_id` int not null,
       `author_fname` varchar(50) not null,
       `author_lname` varchar(50) not null,
       primary key (`author_id`)
);

drop table if exists `article`;

create table `article`(
       `article_id` int not null,
       `article_name` varchar(300) not null,
       `reading_time_minute` int not null,
       `web_address` varchar(500) not null,
       `website_id` int default 0,
       `author_id` int default 0,
       primary key (`article_id`),
       constraint `website_fk` foreign key (`website_id`) references `website` (`website_id`)
       on update cascade on delete cascade,
       constraint `author_fk` foreign key (`author_id`) references `author` (`author_id`)
       on update cascade on delete cascade
);

drop table if exists `article_status`;

create table `article_status`(
       `article_id` int not null,
       `user_id` int not null,
       `status` varchar(20) not null,
       primary key (`article_id`, `user_id`),
       constraint `status_article_fk` foreign key (`article_id`) references `article` (`article_id`)
       on update cascade on delete cascade,
       constraint `status_user_fk` foreign key (`user_id`) references `users` (`user_id`)
       on update cascade on delete cascade
);

drop table if exists `review`;

create table `review`(
       `article_id` int not null,
       `user_id` int not null,
       `rating` float,
       `review` varchar(300),
       primary key (`article_id`, `user_id`),
       constraint `review_article_fk` foreign key (`article_id`) references `article` (`article_id`)
       on update cascade on delete cascade,
       constraint `review_user_fk` foreign key (`user_id`) references `users` (`user_id`)
       on update cascade on delete cascade
);

drop table if exists `tags`;

create table `tags`(
       `article_id` int not null,
       `user_id` int not null,
       `tags` varchar(50),
       primary key (`article_id`, `user_id`),
       constraint `tags_article_fk` foreign key (`article_id`) references `article` (`article_id`)
       on update cascade on delete cascade,
       constraint `tags_user_fk` foreign key (`user_id`) references `users` (`user_id`)
       on update cascade on delete cascade
);

drop table if exists `my_notes`;

create table `my_notes`(
       `article_id` int not null,
       `user_id` int not null,
       `notes` varchar(4000),
       primary key (`article_id`, `user_id`),
       constraint `notes_article_fk` foreign key (`article_id`) references `article` (`article_id`)
       on update cascade on delete cascade,
       constraint `notes_user_fk` foreign key (`user_id`) references `users` (`user_id`)
       on update cascade on delete cascade
);







-- creating database -----------------

use kumar_articles;

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
       
insert into my_notes (article_id, user_id, notes)
values (1, 1, 'review and take notes later'),
	   (2, 1, 'knew most of the points'),
	   (10, 2, 'can be used for writing my article');

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


-- defining procedures and functions -----------------

use kumar_articles;

drop PROCEDURE if EXISTS `articles_greater_than_reading_time`;

DELIMITER //

create PROCEDURE articles_greater_than_reading_time(in read_time int)

BEGIN

    select article_id, article_name, reading_time_minute
    from article
    where reading_time_minute > read_time;
end //

delimiter ;

drop PROCEDURE if EXISTS `articles_less_than_reading_time`;

DELIMITER //

create PROCEDURE articles_less_than_reading_time(in read_time int)

BEGIN

    select article_id, article_name, reading_time_minute
    from article
    where reading_time_minute < read_time;
end //

delimiter ;

drop PROCEDURE if EXISTS `filter_articles_by_rating_status`;

DELIMITER //
create PROCEDURE filter_articles_by_rating_status(in rate float, in art_stat varchar(20))

BEGIN
    -- declare rate_var

    select article.article_id, article_name, rating, status
    from (article left join review on article.article_id = review.article_id)
        left join article_status on article.article_id = article_status.article_id
    where rating > rate and status = art_stat;
end //
delimiter ;

drop procedure if exists `filter_articles_by_status_readingtime_tag`;

delimiter $$
create procedure `filter_articles_by_status_readingtime_tag`(in readtime_min int, in readtime_max int, in art_stat varchar(20), in tag varchar(50))
begin
    select article.article_id, article_name, reading_time_minute, status, tags
    from (article left join article_status as arts on article.article_id = arts.article_id)
        left join tags on article.article_id = tags.article_id
    where reading_time_minute between readtime_min and readtime_max and status = art_stat and tags.tags = tag;
end $$
delimiter ;
