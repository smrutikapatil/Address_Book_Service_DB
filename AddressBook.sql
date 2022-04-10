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


UC3: Ability to insert new Contacts to Address Book
mysql> insert into addressBook (firstName, lastName, address, city, state, zip, phoneNumber, email) VALUES
    -> ('Sneha', 'Khan', 'Dighi', 'Pune', 'MH', 570017, 676767, 'SK@gmail.com'),
    -> ('Raj', 'potu', 'Kher', 'Satar', 'MH', 879617, 877767, 'Rp@gmail.com'),
    -> ('Sravani', 'Katta', 'Manchiryal', 'Tn', 'Tn', 1230017, 124767, 'Spr@gmail.com');
Query OK, 3 rows affected (0.43 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city  | state | zip     | phoneNumber | email         |
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
| Raj       | potu     | Kher       | Satar | MH    |  879617 |      877767 | Rp@gmail.com  |
| Sneha     | Khan     | Dighi      | Pune  | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn    | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+-------+-------+---------+-------------+---------------+
3 rows in set (0.03 sec)

UC4: Ability to edit existing contact person using their name
mysql> update addressBook set city = 'Mumbai' where firstName = 'Sneha';
Query OK, 1 row affected (0.33 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressBook;
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city   | state | zip     | phoneNumber | email         |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| Raj       | potu     | Kher       | Satar  | MH    |  879617 |      877767 | Rp@gmail.com  |
| Sneha     | Khan     | Dighi      | Mumbai | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn     | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
3 rows in set (0.08 sec)


UC5:Ability to delete a person using person's name
mysql> delete from addressBook  where firstName = 'Raj';
Query OK, 1 row affected (0.12 sec)
mysql> select * from addressBook;
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| firstName | lastName | address    | city   | state | zip     | phoneNumber | email         |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
| Sneha     | Khan     | Dighi      | Mumbai | MH    |  570017 |      676767 | SK@gmail.com  |
| Sravani   | Katta    | Manchiryal | Tn     | Tn    | 1230017 |      124767 | Spr@gmail.com |
+-----------+----------+------------+--------+-------+---------+-------------+---------------+
2 rows in set (0.00 sec)



UC6: Ability to Retrieve Person belonging to a City or State from the Address Book
mysql> insert into addressBook (firstName, lastName, address, city, state, zip,phoneNumber, email) VALUES
    -> ('Raj', 'potu', 'Satar', 'Satar', 'MH', 879617, 877767, 'Rp@gmail.com');
Query OK, 1 row affected (0.14 sec)
mysql> select * from addressBook where city = 'Satar';
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
| firstName | lastName | address | city  | state | zip    | phoneNumber | email        |
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
| Raj       | potu     | Satar   | Satar | MH    | 879617 |      877767 | Rp@gmail.com |
+-----------+----------+---------+-------+-------+--------+-------------+--------------+
1 row in set (0.06 sec)
UC7:Ability to understand the count of address book by City and State
mysql> select city, Count(firstName) from addressBook group by city;
+--------+------------------+
| city   | Count(firstName) |
+--------+------------------+
| Satar  |                1 |
| Mumbai |                1 |
| Tn     |                1 |
+--------+------------------+
3 rows in set (0.00 sec)



UC8:Ability to retrieve entries sorted alphabetically by Person’s name for a given city

mysql> select * from addressBook where city = 'Mumbai' ORDER BY firstName ASC;
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
| firstName | lastName | address | city   | state | zip    | phoneNumber | email        |
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
| Sneha     | Khan     | Dighi   | Mumbai | MH    | 570017 |      676767 | SK@gmail.com |
+-----------+----------+---------+--------+-------+--------+-------------+--------------+
1 row in set (0.00 sec)


UC9:identify each addressbook with its name and type

Alter table AddressBook add AddressBookName varchar(45) Not Null after Email_Id;
Alter table AddressBook add AddressBookType varchar(45) Not Null after AddressBookName; 
 
Update AddressBook set AddressBookName= 'AddressBook1' where FirstName  = 'Minal' or FirstName  = 'Pranali';
Update AddressBook set AddressBookName ='AddressBook2' where FirstName  = 'Soniya' or FirstName  = 'Mayuri';
Update AddressBook set AddressBookName = 'AddressBook3' where FirstName  = 'Nikita' or FirstName  = 'Shital';
Update AddressBook set AddressBookType = 'Family' where FirstName  = 'Nikita'  or FirstName  = 'Pranali';
Update AddressBook set AddressBookType = 'Friends' where FirstName  = 'Mayuri' or FirstName  = 'Shital' ;
Update AddressBook set AddressBookType = 'Profession' where FirstName  = 'Minal' or FirstName  = 'Soniya';  

*creating different address books as family , friends amd profession ,all having reference of addressbook

 CREATE table FriendsAddressbook(
Friend_ID     int Not Null auto_increment,
AddressbookID int ,
Primary key (Friend_ID) ,
FOREIGN KEY (AddressbookID) REFERENCES AddressBook(ID) ON DELETE CASCADE
 );
insert into FriendsAddressbook (AddressbookID) values ('5'),('7');
select * from FriendsAddressbook;
 

CREATE table FamilyAddressbook(
Family_ID     int Not Null auto_increment,
AddressbookID int ,
Primary key (Family_ID) ,
FOREIGN KEY (AddressbookID) REFERENCES AddressBook(ID) ON DELETE CASCADE
 ); 
insert into FamilyAddressbook (AddressbookID) values ('2'),('3'); 
select * from FamilyAddressbook;
 

CREATE table ProfessionalAddressbook(
Profession_ID     int Not Null auto_increment,
AddressbookID int ,
Primary key (Profession_ID) ,
FOREIGN KEY (AddressbookID) REFERENCES AddressBook(ID) ON DELETE CASCADE
 );  
insert into ProfessionalAddressbook (AddressbookID) values ('4'),('6'); 
select * from ProfessionalAddressbook;


UC:10 Ability to get count by type

Select Count(FirstName) From AddressBook where AddressBookType = 'Family' order by FirstName;		#Count 2
Select Count(FirstName) From AddressBook where AddressBookType = 'Friends' order by FirstName;		#Count 2
Select Count(FirstName) From AddressBook where AddressBookType = 'Profession' order by FirstName;	#Count 2


UC:11 insert contact in family addressbook by using addressbook class
 INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID,AddressBookName,addressBookType)
					VALUES ('Rupali', 'Takhare', 'Paris Complex', 'Nagpur', 'Maharashtra', '481204', '9935009787', 'mayuri10@gmail.com', 'Addressbook1', 'Family');
select @@last_insert_id ;
insert into familyaddressbook (AddressbookID) values (@@last_insert_id);
select * from FamilyAddressbook;
select * from addressbook;


UC:11 insert contact in friends addressbook by using addressbook class
 INSERT INTO addressbook(FirstName, LastName, Address, City, State, Zip, PhoneNo, Email_ID,AddressBookName,addressBookType)
					VALUES ('Dipali', 'Shahare', 'Mahda Colony', 'Chandrapur', 'Maharashtra', '400204', '9555009787', 'shaharedipali@gmail.com', 'Addressbook3', 'Friend');
select @@last_insert_id ;
insert into friendsaddressbook (AddressbookID) values (@@last_insert_id);
select * from friendsaddressbook;
select * from Addressbook;
select * from addressbook;


UC:13 

#refactor uc6 i.e. retrive data from address book using city or state with new table structure 

select * from addressbook a1, familyaddressbook f1 where a1.ID=f1.AddressbookID  and city='Bhandara';
select * from addressbook a1, friendsaddressbook friend1 where a1.ID=friend1.AddressbookID and city='Bhandara';
select * from addressbook a1, professionaladdressbook p1 where a1.ID=p1.AddressbookID and city='Bhandara';

#refactor uc7 i.e. grt count by city or state with new table structure
 
select count(id) from addressbook a1, familyaddressbook f1 where a1.ID=f1.AddressbookID  and city='Bhandara'; #Count:2
select count(id) from addressbook a1, friendsaddressbook friend1 where a1.ID=friend1.AddressbookID and city='Bhandara'; #Count:1
select count(id) from addressbook a1, professionaladdressbook p1 where a1.ID=p1.AddressbookID and city='Bhandara'; #Count:0

#refactor uc8 i.e. sort alphabetically address book using city or state with new table structure 

select * from addressbook a1, familyaddressbook f1 where a1.ID=f1.AddressbookID  and city='Bhandara' order by FirstName;
select * from addressbook a1, friendsaddressbook friend1 where a1.ID=friend1.AddressbookID and city='Bhandara' order by FirstName;
select * from addressbook a1, professionaladdressbook p1 where a1.ID=p1.AddressbookID and city='Bhandara' order by FirstName;

#refactor UC 10 Ability to get count by type
Select Count(FirstName) From AddressBook where AddressBookType = 'Family' order by FirstName;		#Count 2
Select Count(FirstName) From AddressBook where AddressBookType = 'Friends' order by FirstName;		#Count 2
Select Count(FirstName) From AddressBook where AddressBookType = 'Profession' order by FirstName;	#Count 2
