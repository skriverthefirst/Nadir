import os
import json
import sqlite3

import sys
import os
folder = os.path.dirname(os.path.abspath(__file__))  # noqa
sys.path.insert(0, os.path.normpath("{}/..".format(folder)))  # noqa

from serializers import dartSerializer, ikeaSerializer

#DBHandler is used as a context manager to ensure the correct way of opening and closing the DB
class DBHandler():
    def __init__(self, dbName):
        self._connection = sqlite3.connect(dbName, check_same_thread=False)
        self._cursor = self._connection.cursor()

    def __enter__(self):
        return self

    def createEntry(self, obj):
        pass

    def editEntry(self, obj):
        pass #USE UPDATE DB FUNCTION

    def delEntry():
        pass

    def __exit__(self, exc_type, exc_val, exc_tb):
        self._cursor.close()
        self._connection.close()
