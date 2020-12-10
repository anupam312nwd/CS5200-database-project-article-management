#!/usr/bin/env python

import pymysql


def insert_author(cnx):
    cur = cnx.cursor()
    auth_id = input("type author_id: ")
    auth_fname = input("type author first name: ")
    auth_lname = input("type author last name: ")

    insert_author_stmt = (
        "insert into author (author_id, author_fname, author_lname) values (%s, %s, %s)"
    )

    cur.execute(insert_author_stmt, (auth_id, auth_fname, auth_lname))
    print("author tuple inserted.")
    cnx.commit()
    cur.close()
    return None


def insert_article(cnx):
    cur = cnx.cursor()
    art_id = input("type article_id: ")
    art_name = input("type article name: ")
    read_time = input("type reading time: ")
    web_add = input("type article website: ")
    web_id = input("type website_id: ")
    auth_id = input("type author id: ")

    insert_article_stmt = "insert into article (article_id, article_name, reading_time_minute, web_address, website_id, author_id) values (%s, %s, %s, %s, %s, %s)"

    if not web_id or web_id == 'None' or web_id == '0':
        web_id = None

    if not auth_id or auth_id == 'None' or auth_id == '0':
        auth_id = None

    cur.execute(
        insert_article_stmt,
        (art_id, art_name, read_time, web_add, web_id, auth_id),
    )
    print("article tuple inserted.")
    cnx.commit()
    cur.close()
    return None


def insert_website(cnx):
    cur = cnx.cursor()
    web_id = input("type a website id: ")
    web_add = input("type website address: ")
    rate = input("type website rating: ")

    insert_website_stmt = (
        "insert into website (website_id, web_address, rating) values (%s, %s, %s)"
    )

    cur.execute(insert_website_stmt, (web_id, web_add, rate))
    print("website tuple inserted.")
    cnx.commit()
    cur.close()
    return None


def insert_article_status(cnx):
    cur = cnx.cursor()
    art_id = input("type article_id: ")
    user_id = input("type input_id: ")
    status = input("choose ('reading', 'read', 'unread') status of article: ")

    insert_article_status_stmt = ("insert into article_status (article_id, user_id, status) values (%s, %s, %s)")

    cur.execute(insert_article_status_stmt, (art_id, user_id, status))
    print("article status inserted.")
    cnx.commit()
    cur.close()
    return None

def insert_review(cnx):
    cur = cnx.cursor()
    art_id = input("type article_id: ")
    usr_id = input("type user_id: ")
    rating = input("type rating: ")
    review = input("write your review: ")

    insert_review_stmt = ("insert into review (article_id, user_id, rating, review) values (%s, %s, %s, %s)")

    cur.execute(insert_review_stmt, (art_id, usr_id, rating, review))
    print("article review inserted")
    cnx.commit()
    cur.close()
    return None

def insert_my_notes(cnx):
    cur = cnx.cursor()
    art_id = input("type article_id: ")
    usr_id = input("type user_id: ")
    notes = input("type notes: ")

    insert_notes_stmt = ("insert into my_notes (article_id, user_id, notes) values (%s, %s, %s)")

    cur.execute(insert_notes_stmt, (art_id, usr_id, notes))
    print("my_notes for article inserted")
    cnx.commit()
    cur.close()
    return None
