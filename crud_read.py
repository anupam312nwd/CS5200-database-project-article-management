#!/usr/bin/env python

import pymysql


def read_author(cnx):
    cur = cnx.cursor()
    auth_stmt = "select * from author"
    cur.execute(auth_stmt)
    rows = cur.fetchall()
    for row in rows:
        print(row)


def read_article(cnx):
    cur = cnx.cursor()
    art_stmt = "select article_id, article_name from article"
    cur.execute(art_stmt)
    rows = cur.fetchall()
    for row in rows:
        print(row)


def read_status(cnx):
    cur = cnx.cursor()
    sta_stmt = "select article_id, user_id, status from article_status"
    cur.execute(sta_stmt)
    rows = cur.fetchall()
    for row in rows:
        print(row)
