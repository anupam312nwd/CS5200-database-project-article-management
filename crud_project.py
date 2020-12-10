import pymysql
import webbrowser

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
    for row in rows:
        print(row)

    # cur.execute(insert_author_stmt)
    # print("author tuple inserted.")
    # cnx.commit()

    def insert_author(cnx=cnx):

        cur = cnx.cursor()
        auth_id = input("type author_id: ")
        auth_fname = input("type author first name: ")
        auth_lname = input("type author last name: ")

        insert_author_stmt = "insert into author (author_id, author_fname, author_lname) values (%s, %s, %s)"

        cur.execute(insert_author_stmt, (auth_id, auth_fname, auth_lname))
        print("author tuple inserted.")
        cnx.commit()
        cur.close()
        return None

    insert_author()

    def delete_author():
        for row in rows:
            print(row)
        auth_id = input("type author_id to delete: ")
        delete_author_stmt = "delete from author where author_id = %s"
        cur.execute(delete_author_stmt, (auth_id))
        print("author tuple deleted")
        cnx.commit()
        return None

    # delete_author()

    def update_author():
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

    # update_author()

    print("--------------------------------------------------")

    def open_article_website():
        print("listing articles: ")
        cur_a = cnx.cursor()
        article_query = "select article_id, article_name, reading_time_min from article"
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

    open_article_website()

    # char_names = [dct["character_name"] for dct in rows]
    # print("all-characters list: ", char_names)

    # while True:
    #     char_name = input("type a character name from all-characters list: ")
    #     try:
    #         if char_name.capitalize() not in char_names:
    #             raise ValueError("Input char_name '%s' not a character!!" % char_name.capitalize())
    #         else:
    #             print("The character %s is found!!" % char_name.capitalize())
    #             break
    #     except ValueError as e:
    #         print(e)

    # result = cur.callproc("track_character", (char_name,))
    # print("Tracking character ----------------------------")
    # for row in cur.fetchall():
    #     print(row)

except pymysql.Error as e:
    print("Error: %d: %s" % (e.args[0], e.args[1]))

finally:
    cur.close()
