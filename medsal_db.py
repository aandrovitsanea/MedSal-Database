#!/usr/bin/env python
# coding: utf-8

# MedSal Database
# Connection & Data query
# 
# University of Applied Sciences of Lübeck
# 
# Anna Androvitsanea
# anna.androvitsanea@th-luebeck.de

# This scripts includes the code for connecting and querying the data that have been uploaded to the MedSal's project [database](https://www.uhydro.de/medsaldb/index.php). 

from __future__ import print_function


# Import libraries


from datetime import date, datetime, timedelta
import mysql.connector
from mysql.connector import Error

import sqlalchemy as db
from sqlalchemy import create_engine, MetaData, Table, Column, String
from sqlalchemy.ext.automap import automap_base

import pandas as pd

# Connection

# Engine

# Create an engine to access the database as guest
print("\n")
print('**************************')
print('Connecting to the database')
print('**************************')

engine = db.create_engine('mysql+mysqlconnector://uhydro_16_r:MiRcTD69aRAYn2Ji@sql628.your-server.de:3306/uhydro_db16') # connect to server


# Entities

# Print the names of the available tables

Base = automap_base()
Base.prepare(engine, reflect=True)

print("The entities of the database are the following: ")
print("\n")
print(Base.classes.keys())


# Attributes

# Choose one entity to see its attributes
print("\n")
entity = raw_input("Please type the name of the entity you want to see its attributes, as presented in the list above, e.g. Stage_data: ")
print("\n")
print("You typed: ")
print(entity)
print("\n")
# Function to enumerate and print the attributes of a table

def find_attributes(entity, engine):
    #  search the attributes of the entity
    meta = MetaData(bind = engine)
    table = Table(entity, meta, autoload = True, autoload_with = engine)
    columns = [c for c in table.columns]
    for i in range(len(columns)):
        column = columns[i]
        print("%d. Table %s: Attribute %s." % (i + 1, entity, column.name))


# Check attributes for the chosen table
print("The entity has the following attributes: \n")
find_attributes(entity, engine)
print("\n")
# make connection as guest

connection = mysql.connector.connect(user='uhydro_16_r', 
                                     password='MiRcTD69aRAYn2Ji',
                                     host='sql628.your-server.de',
                                     database='uhydro_db16')

# construct cursor to store the data

cursor = connection.cursor()

# state query in raw sql and save it in the variable query

query = raw_input("Please type your SQL query, e.g. 'SELECT * FROM Gauging_characteristics': ")
print("\n")
# execute query
print('***************')
print('Executing query')
print('***************')
cursor.execute(query)
print("\n")
# print the output of the query
print('******************')
print('Print query output')
print('******************')
print("\n")
for i in cursor:
    print(i)
      
# save all data into a dataframe for further processing

data = pd.read_sql(query, connection)

cursor.close()       
connection.close()

print("\n")
# Export the results of the query to a csv file
print('*******************************')
print('Export query output to csv file')
data.to_csv('data.csv', sep =';', index = False, header = True, encoding = 'utf-8')
#with open('data.csv', mode='w') as data:
#    csv.writer(data, delimiter=';', header = True)
print('*******************************')
print("\n")
print('*************')
print('End of script')
print('*************')
