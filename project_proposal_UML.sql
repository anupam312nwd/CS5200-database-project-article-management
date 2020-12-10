
create database if not exists `articles`;

use `articles`;

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
