#!/usr/bin/env python3

import mysql.connector

def connect():
    try:
        conn = mysql.connector.connect(
            database="pySQL",
            user="myuser",
            password="mypass",
            host="mysql",  # Assuming 'mysql' is the service name in docker-compose.yml
            port="3306"
        )
        return conn
    except mysql.connector.Error as e:
        print("Error connecting to MySQL database:", e)

def create_tables(conn):
    try:
        cur = conn.cursor()
        with open('1_create.sql', 'r') as f:
            sql_commands = f.read()
        for result in cur.execute(sql_commands, multi=True):
            if result.with_rows:
                # Consume any results if there are any
                print(result.fetchall())
        conn.commit()
        print("Tables created successfully!")
    except mysql.connector.Error as e:
        # Corrected error message
        print("Error creating tables:", e)
        conn.rollback()

def seed_data(conn):
    try:
        cur = conn.cursor()
        with open('2_seed.sql', 'r') as f:
            sql_commands = f.read()
        for result in cur.execute(sql_commands, multi=True):
            if result.with_rows:
                # Consume any results if there are any
                print(result.fetchall())
        conn.commit()
        print("Tables seeded successfully!")
    except mysql.connector.Error as e:
        print("Error seeding tables with data:", e)
        conn.rollback()

def query_data(conn):
    try:
        cur = conn.cursor()
        query = """
            SELECT t.name, r.room_name, a.appt_name
            FROM tenants t
            JOIN rooms r ON t.tenant_id = r.tenant_id
            JOIN apartments a ON r.room_id = a.room_id
        """
        cur.execute(query)
        rows = cur.fetchall()
        for row in rows:
            print(f"Tenant Name: {row[0]}, Room Name: {row[1]}, Apartment Name: {row[2]}")
    except mysql.connector.Error as e:
        print("Error executing query:", e)

if __name__ == "__main__":
    conn = connect()
    if conn is not None:
        create_tables(conn)
        seed_data(conn)
        query_data(conn)
        conn.close()
