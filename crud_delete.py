#!/usr/bin/env python

import pymysql


def delete_author(cnx):
    cur = cnx.cursor()
    auth_id = input("type author_id to delete: ")
    delete_author_stmt = "delete from author where author_id = %s"
    cur.execute(delete_author_stmt, (auth_id))
    print("author tuple deleted")
    cnx.commit()
    return None


def delete_article(cnx):
    cur = cnx.cursor()
    art_id = input("type artile_id to delete: ")
    delete_article_stmt = "delete from article where article_id = %s"
    cur.execute(delete_article_stmt, (art_id))
    print("article tuple deleted")
    cnx.commit()
    return None


def delete_website(cnx):
    cur = cnx.cursor()
    web_id = input("type website_id to delete: ")
    delete_website_stmt = "delete from website where website_id = %s"
    cur.execute(delete_website_stmt, (web_id))
    print("website tuple deleted")
    cnx.commit()
    return None
