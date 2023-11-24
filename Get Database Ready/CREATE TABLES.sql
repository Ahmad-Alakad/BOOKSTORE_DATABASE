--CREATE TABLES
-----------------------
-----------------------

---------------------
--PUBLISHER TABLE
---------------------
create table BSTORE.Publisher ( 
PID number(10),
Name varchar(225) NOT NULL, 
Address varchar(255) NOT NULL,
Phone  varchar(255) NOT NULL,
URL varchar(255) NOT NULL,
constraint Publisher_pk primary key (PID)
)TABLESPACE "CONTENTCREATOR" PCTFREE 65 LOGGING ;
--===================================================================--

--------------------
--AUTHOR TABLE
---------------------
create table BSTORE.Author (
AID number(10),
Name varchar(225) NOT NULL, 
Address varchar(255) NOT NULL,
URL varchar(255) NOT NULL,
constraint Author_pk primary key (AID)
)TABLESPACE "CONTENTCREATOR" PCTFREE 56 LOGGING ;
--=========================================================================--

---------------------
--BOOK TABLE
----------------------
CREATE TABLE BSTORE.Book (
ISBN number(10),
AutherID number(10),
PublisherID number(10),
Year number(4) NOT NULL,
Title varchar(255) NOT NULL,
price number(19,0) NOT NULL,
CONSTRAINT isbn_pk PRIMARY KEY (ISBN),
CONSTRAINT publisherID_fk FOREIGN KEY (PublisherID ) REFERENCES  Bstore.Publisher(PID),
    CONSTRAINT autherID_fk  FOREIGN KEY (AutherID) REFERENCES  Bstore.Author(AID)
    )TABLESPACE "BOOK" PCTFREE 53 LOGGING ;
--=========================================================================================--

-----------------------
--WAREHOUSE TABLE
-----------------------
create table BSTORE.Warehouse (
 Code number(10) , 
 Phone varchar(255) NOT NULL,
 Address varchar(255) NOT NULL,
 constraint code_pk primary key (Code)
)TABLESPACE "WAREHOUSE" PCTFREE 55 LOGGING ;
--================================================================================================--

----------------------------
--WAREHOUSE BOOK TABLE
----------------------------
create table BSTORE.Warehouse_Book ( 
WarehouseCode number(10) ,
BookISBN number(10) ,
Count number(10) NOT NULL,
constraint war_cod_pk foreign key (WarehouseCode) references  Bstore.Warehouse(Code) ,
constraint bok_id_pk foreign key (BookISBN) references  Bstore.Book(ISBN),
CONSTRAINT pk_warehouse_book PRIMARY KEY (WarehouseCode, BookISBN)
)TABLESPACE "WAREHOUSE" PCTFREE 65 LOGGING ;
--========================================================================================================--

----------------------------
--CUSTOMER TABLE
----------------------------
CREATE TABLE BSTORE.customer (
    EMAIL VARCHAR2(255),
    Name VARCHAR2(255) NOT NULL,
    Phone VARCHAR2(255) NOT NULL,
    Address VARCHAR2(255) NOT NULL,
    constraint email_pk primary key (email))
TABLESPACE "SALES" PCTFREE 65 LOGGING ;
--==================================================================================================--

----------------------------------
--SHOPPING BASKET TABLE
----------------------------------
create table BSTORE.ShoppingBasket ( 
ID number(10) ,
CustomerEmail varchar(255) NOT NULL, 
constraint id_pk primary key (id),
constraint cust_em_pk foreign key (CustomerEmail) references Bstore.customer(Email) 
)TABLESPACE "SALES" PCTFREE 63 LOGGING ;
--=====================================================================================================--

---------------------------------------------------
--SHOPPING BASKET TABLE
-----------------------------------------------------
create table BSTORE.ShoppingBasket_Book (
ShoppingBasket_ID number(10) , 
BookISBN number(10) ,
Count number(10) NOT NULL,
Sdate timestamp NOT NULL,
constraint bas_book_fk foreign key (ShoppingBasket_ID) references Bstore.ShoppingBasket(ID) ,
constraint bok_isbn_fk foreign key (BookISBN) references Bstore.Book(ISBN),
CONSTRAINT pk_shopping_basket_book PRIMARY KEY (ShoppingBasket_ID, BookISBN)
) TABLESPACE "SALES" PCTFREE 58 LOGGING ;
