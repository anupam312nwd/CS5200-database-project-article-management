#!/usr/bin/env python

import pymysql


def update_author(cnx):
    cur = cnx.cursor()
    auth_id = input("type author_id: ")
    auth_fname = input("type author first name: ")
    auth_lname = input("type author last name: ")

    update_author_stmt = (
        "update author set author_fname=%s, author_lname=%s where author_id=%s"
    )
    cur.execute(update_author_stmt, (auth_fname, auth_lname, auth_id))
    print("author tuple updated")
    cnx.commit()
    return None


def update_article(cnx):
    cur = cnx.cursor()
    art_id = input("type article_id: ")
    web_id = input("type website_id: ")
    auth_id = input("type author id: ")

    update_article_stmt = (
        "update article set website_id=%s, author_id=%s where article_id=%s"
    )
    cur.execute(update_article_stmt, (web_id, auth_id, art_id))
    print("author tuple updated")
    cnx.commit()
    return None


def update_website(cnx):
    cur = cnx.cursor()
    web_id = input("type website_id whose rating to update: ")
    rating = input("type rating: ")

    update_website_stmt = "update website set rating=%s where website_id=%s"
    cur.execute(update_website_stmt, (web_id, rating))
    print("website rating updated")
    cnx.commit()
    return None


def update_status(cnx):
    cur = cnx.cursor()
    art_id = input("type article id whose status need to be changed: ")
    status = input("choose status from 'unread', 'reading', 'read': ")
    update_status_stmt = "update article_status set status=%s where article_id=%s"
    cur.execute(update_status_stmt, (status, art_id))
    print("article status updated")
    cnx.commit()
    return None
