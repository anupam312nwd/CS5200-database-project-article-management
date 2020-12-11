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
