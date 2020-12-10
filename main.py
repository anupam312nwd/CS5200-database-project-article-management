#!/usr/bin/env python

import pymysql
import webbrowser
from crud_create import *
from crud_delete import *
from crud_update import *
from crud_read import *
from miscellaneous_fun import *

# username = input("type your MySQL user: ")
# password = input("type your MySQL password: ")

try:
    cnx = pymysql.connect(
        host="localhost",
        # user=username,
        user="root",
        # password=password,
        password="mysqlmac",
        db="articles",
        charset="utf8mb4",
        cursorclass=pymysql.cursors.DictCursor,
    )
except pymysql.err.OperationalError:
    print("Error: %d: %s" % (e.args[0], e.args[1]))


try:
    cur = cnx.cursor()
    stmt_select = "select * from author"
    cur.execute(stmt_select)
    rows = cur.fetchall()
    # for row in rows:
    #     print(row)

    print("--------------------------------------------------")
    print("function id -> function")
    print("1 -> create/insert operation")
    print("2 -> read operation")
    print("3 -> update operation")
    print("4 -> delete operation")
    print("5 -> open article by article_id")
    print("6 -> complex queries")
    print("--------------------------------------------------")

    # run_fun = {1: insert_author, 2: delete_author}
    fun_val = int(input("type a function id: "))
    # run_fun[fun_val](cnx)

    if fun_val == 1:
        print("--------------------------------------------------")
        print("insert id -> function")
        print("1 -> insert Author")
        print("2 -> insert Article")
        print("3 -> insert Website")
        print("4 -> insert article_status")
        print("5 -> insert review")
        print("6 -> insert my_notes")
        print("--------------------------------------------------")
        insert_val = int(input("type a insert id: "))
        run_insert = {
            1: insert_author,
            2: insert_article,
            3: insert_website,
            4: insert_article_status,
            5: insert_review,
            6: insert_my_notes,
        }
        run_insert[insert_val](cnx)

    elif fun_val == 2:
        print("--------------------------------------------------")
        print("read id -> function")
        print("1 -> read Author")
        print("2 -> read Article")
        print("3 -> read article_status")
        print("--------------------------------------------------")
        insert_val = int(input("type a insert id: "))
        run_insert = {1: read_author, 2: read_article, 3: read_status}
        run_insert[insert_val](cnx)

    elif fun_val == 3:
        print("--------------------------------------------------")
        print("update id -> function")
        print("1 -> update Author")
        print("2 -> update Article")
        print("3 -> update article_status")
        print("--------------------------------------------------")
        insert_val = int(input("type a insert id: "))
        run_insert = {1: update_author, 2: update_article, 3: update_status}
        run_insert[insert_val](cnx)

    elif fun_val == 4:
        print("--------------------------------------------------")
        print("delete id -> function")
        print("1 -> delete author")
        print("2 -> delete article")
        print("3 -> delete website")
        print("--------------------------------------------------")
        insert_val = int(input("type a delete id: "))
        run_insert = {1: delete_author, 2: delete_article, 3: delete_website}
        run_insert[insert_val](cnx)

    elif fun_val == 5:
        open_article_website(cnx)

    elif fun_val == 6:
        print("--------------------------------------------------")
        print("query id -> function")
        print("1 -> query article by reading time")
        print("2 -> query article by rating and article status")
        print("--------------------------------------------------")
        query_val = int(input("type a query id: "))
        cur = cnx.cursor()
        if query_val == 1:
            comparison_op = input("type comparison operator '<' or '>' : ")
            read_time = input("enter a reading time: ")
            if comparison_op == "<":
                cur.callproc("articles_less_than_reading_time", (read_time,))
            else:
                cur.callproc("articles_greater_than_reading_time", (read_time,))
        elif query_val == 2:
            rating_var = input("type min rating cut-off: ")
            status_var = input("choose status from 'unread', 'reading' 'read': ")
            cur.callproc(
                "filter_articles_by_rating_status",
                (
                    rating_var,
                    status_var,
                ),
            )
        else:
            print("query value entered is not valid!")

        for row in cur.fetchall():
            print(row)


except pymysql.Error as e:
    print("Error: %d: %s" % (e.args[0], e.args[1]))

finally:
    cur.close()
