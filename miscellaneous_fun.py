#!/usr/bin/env python

import webbrowser


def open_article_website(cnx):
    print("listing articles: ")
    cur_a = cnx.cursor()
    article_query = "select article_id, article_name, reading_time_minute from article"
    cur_a.execute(article_query)
    all_articles = cur_a.fetchall()
    for row in all_articles:
        print(row)
    art_id = input("type article_id to open that article on web: ")
    art_stmt = "select web_address from article where article_id = %s"
    cur_a.execute(art_stmt, art_id)
    art_web_add = cur_a.fetchall()[0]["web_address"]
    print(art_web_add)
    webbrowser.open(art_web_add)
    cur_a.close()
