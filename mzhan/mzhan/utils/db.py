# coding=utf8
import psycopg2


HOST = 'localhost'
PORT = '5432'
DATABASE = 'mzhan'
USER = 'huangkaijie'
PASSWORD = 'raybo'


class BaseDB(object):

    def __init__(self, database='mzhan',port='5432'):
        self.conn = psycopg2.connect(database=database, password=PASSWORD, user=USER, host=HOST, port=port)
        self.cur = self.conn.cursor()

    def query(self, table=None, columns_values=None):
        # 插入操作
        if table and columns_values:
            sql = 'INSERT INTO  %s  %s  ' % (table, columns_values)
            self.cur.execute(sql)
            self.commit()
        pass

    def update(self):
        # 更新操作
        pass

    def commit(self):
        self.conn.commit()

    def close(self):
        self.conn.close()
