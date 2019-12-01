import os
import json
import sqlite3

# from serializers import dartSerializer, ikeaSerializer

#DBHandler is used as a context manager to ensure the correct way of opening and closing the DB
class DBHandler():
    def __init__(self, dbName):
        self._connection = sqlite3.connect(dbName)
        self._cursor = self._connection.cursor()

    def __enter__(self):
        self.firstTimeSetup()
        return self

    def createEntry(self, obj):
        pass

    def editEntry(self, obj):
        pass #USE UPDATE DB FUNCTION

    def delEntry(self):
        pass

    def __exit__(self, exc_type, exc_val, exc_tb):
        self._cursor.close()
        self._connection.close()

    def firstTimeSetup(self):
        try:
            self._cursor.execute('''
                CREATE TABLE devices (
                    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    deviceGroup TEXT,
                    gateway TEXT,
                    gatewayIP TEXT )
            ''')
            self._cursor.execute('''
                CREATE TABLE groups (
                    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                    deviceGroup TEXT )
            ''')
        except sqlite3.OperationalError:
            print("The tables already excists")