#!/usr/bin/env python

import pymysql
from miscellaneous_fun import *


def delete_author(cnx):
    cur = cnx.cursor()
    cur_auth = cnx.cursor()
    stmt = "select author_id from author"
    cur_auth.execute(stmt)
    auth_id_lst = [dct["author_id"] for dct in cur_auth.fetchall()]
    print("author_id list:", auth_id_lst)
    auth_id = tryexcept_val_list(auth_id_lst, "type author_id to delete: ")
    delete_author_stmt = "delete from author where author_id = %s"
    cur.execute(delete_author_stmt, (auth_id))
    print("author tuple {} deleted".format(auth_id))
    cnx.commit()
    return None


def delete_article(cnx):
    cur = cnx.cursor()
    cur_art = cnx.cursor()
    stmt = "select article_id from article"
    cur_art.execute(stmt)
    art_id_lst = [dct["article_id"] for dct in cur_art.fetchall()]
    print("article_id list:", art_id_lst)
    art_id = tryexcept_val_list(art_id_lst, "type article_id to delete: ")
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
