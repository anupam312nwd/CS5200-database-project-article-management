#!/usr/bin/env python

import webbrowser


def tryexcept_int_val_stmt(k, stmt):
    while True:
        try:
            x = int(input(stmt))
        except ValueError:
            print(
                "that was not valid. please type an integer between 1 and {} -- ".format(
                    k
                )
            )
        else:
            if x in range(1, k + 1):
                break
            else:
                print(
                    "Out of Range. please type an integer between 1 and {} -- ".format(
                        k
                    )
                )
    return x


def tryexcept_val_list(lst, stmt):
    while True:
        try:
            var = int(input(stmt))
        except ValueError:
            print("Not valid. Please try again...")
        else:
            if var in lst:
                break
            else:
                print("value not in list. please try again.")
    return var


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
