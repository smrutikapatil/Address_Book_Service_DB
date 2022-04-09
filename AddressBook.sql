UC1: Ability to create a Address Book Service DB

mysql> create database Address_Book_Service;
Query OK, 1 row affected (0.30 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| information_schema   |
| invoicing            |
| mysql                |
| payroll_services     |
| performance_schema   |
| sakila               |
| sql_hr               |
| sql_inventory        |
| store                |
| sys                  |
| world                |
+----------------------+
12 rows in set (0.00 sec)

mysql> USE Address_Book_Service;
Database changed

UC2:Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes

mysql> create table addressBook
    -> (
    -> firstName VARCHAR(32) NOT NULL,
    -> lastName VARCHAR(32) NOT NULL,
    -> address VARCHAR(150) NOT NULL,
    -> city VARCHAR(32) NOT NULL,
    -> state VARCHAR(32) NOT NULL,
    -> zip INT unsigned NOT NULL,
    -> phoneNumber INT unsigned NOT NULL,
    -> email VARCHAR(150) NOT NULL,
    -> PRIMARY KEY (firstName)
    -> );
Query OK, 0 rows affected (1.79 sec)

mysql> Describe addressBook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(32)  | NO   | PRI | NULL    |       |
| lastName    | varchar(32)  | NO   |     | NULL    |       |
| address     | varchar(150) | NO   |     | NULL    |       |
| city        | varchar(32)  | NO   |     | NULL    |       |
| state       | varchar(32)  | NO   |     | NULL    |       |
| zip         | int unsigned | NO   |     | NULL    |       |
| phoneNumber | int unsigned | NO   |     | NULL    |       |
| email       | varchar(150) | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.06 sec)


