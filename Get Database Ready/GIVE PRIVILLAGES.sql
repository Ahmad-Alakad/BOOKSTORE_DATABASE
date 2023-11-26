--GIVE PRIVILLAGES
--------------------------
--------------------------

---------------------------
---BSTORE SCHEMA OWNER
---------------------------
GRANT CREATE SESSION TO BSTORE;
GRANT CREATE TABLE TO BSTORE;
GRANT CREATE SEQUENCE TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.author TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.PUBLISHER TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.BOOK TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.WAREHOUSE TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.WAREHOUSE_BOOK TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.CUSTOMER TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.SHOPPINGBASKET_BOOK TO BSTORE;
GRANT SELECT, INSERT, UPDATE ON BSTORE.SHOPPINGBASKET TO BSTORE;

ALTER USER BSTORE QUOTA UNLIMITED ON  ContentCreator;
ALTER USER BSTORE QUOTA UNLIMITED ON sales ;
ALTER USER BSTORE QUOTA UNLIMITED ON BOOK ;
ALTER USER BSTORE QUOTA UNLIMITED ON WAREHOUSE ;
--======================================================================================--

---------------
--DBAs
---------------
GRANT "CONNECT","RESOURCE","DBA",SYSDBA TO "DBA1";
GRANT "CONNECT","RESOURCE","DBA" TO "DBA2";
--===========================================================================================--

-----------------------
--WAREHOUS MANAGER
-----------------------
GRANT "CONNECT","RESOURCE" TO  "WAREHOUSE_MANAGER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.BOOK TO "WAREHOUSE_MANAGER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.WAREHOUSE TO "WAREHOUSE_MANAGER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.WAREHOUSE_BOOK TO "WAREHOUSE_MANAGER";

ALTER USER "WAREHOUSE_MANAGER" QUOTA 15M ON BOOK ;   ---15mb
ALTER USER "WAREHOUSE_MANAGER" QUOTA 26M ON WAREHOUSE ;  ---26mb
--===================================================================================================--

----------------------
--OWNER
-----------------------
GRANT "CONNECT","RESOURCE" TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.author TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.PUBLISHER TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.BOOK TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.WAREHOUSE TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.WAREHOUSE_BOOK TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.CUSTOMER TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.SHOPPINGBASKET_BOOK TO "OWNER";
GRANT SELECT, INSERT, UPDATE ON BSTORE.SHOPPINGBASKET TO "OWNER";

ALTER USER "OWNER" QUOTA UNLIMITED ON  ContentCreator;
ALTER USER "OWNER" QUOTA UNLIMITED ON sales ;
ALTER USER "OWNER" QUOTA UNLIMITED ON BOOK ;
ALTER USER "OWNER" QUOTA UNLIMITED ON WAREHOUSE ;
--======================================================================================================--

--------------------
--SALES MANAGER
--------------------
GRANT "CONNECT","RESOURCE" TO "SALES_MANAGER";
GRANT SELECT ON BSTORE.author TO "SALES_MANAGER";
GRANT SELECT ON BSTORE.PUBLISHER TO "SALES_MANAGER";
GRANT SELECT ON BSTORE.BOOK TO "SALES_MANAGER";
GRANT SELECT ON BSTORE.CUSTOMER TO "SALES_MANAGER";
GRANT SELECT ON BSTORE.SHOPPINGBASKET_BOOK TO "SALES_MANAGER";
--============================================================================================================--

-------------------------
--TEAM LEAD DEVELOPER
-------------------------
GRANT "CONNECT","RESOURCE" TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.author TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.PUBLISHER TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.BOOK TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.CUSTOMER TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.SHOPPINGBASKET_BOOK TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.WAREHOUSE TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.WAREHOUSE_BOOK TO "TEAM_LEAD_DEVELOPER";
GRANT SELECT ON BSTORE.SHOPPINGBASKET TO "TEAM_LEAD_DEVELOPER";
--===============================================================================================================--

--------------------
--DEVELOPER
--------------------
GRANT "CONNECT","RESOURCE" TO "developer";
GRANT SELECT ON BSTORE.author TO "developer";
GRANT SELECT ON BSTORE.PUBLISHER TO "developer";
GRANT SELECT ON BSTORE.BOOK TO "developer";
GRANT SELECT ON BSTORE.CUSTOMER TO "developer";
GRANT SELECT ON BSTORE.SHOPPINGBASKET_BOOK TO "developer";
GRANT SELECT ON BSTORE.WAREHOUSE TO "developer";
GRANT SELECT ON BSTORE.WAREHOUSE_BOOK TO "developer";
GRANT SELECT ON BSTORE.SHOPPINGBASKET TO "developer";
--====================================================================================================================--

---------------------
--data analyist
---------------------
GRANT "CONNECT","RESOURCE" TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.author TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.PUBLISHER TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.BOOK TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.CUSTOMER TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.SHOPPINGBASKET_BOOK TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.WAREHOUSE TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.WAREHOUSE_BOOK TO "DATA_ANALYST";
GRANT SELECT ON BSTORE.SHOPPINGBASKET TO "DATA_ANALYST";
--==========================================================================================================================--

---------------
--ACCOUNTANT
----------------
GRANT "CONNECT","RESOURCE" TO "accountant";
GRANT SELECT ON BSTORE.author TO "accountant";
GRANT SELECT ON BSTORE.PUBLISHER TO "accountant";
GRANT SELECT ON BSTORE.BOOK TO "accountant";
GRANT SELECT ON BSTORE.CUSTOMER TO "accountant";
GRANT SELECT ON BSTORE.SHOPPINGBASKET_BOOK TO "accountant";
GRANT SELECT ON BSTORE.WAREHOUSE TO "accountant";
GRANT SELECT ON BSTORE.WAREHOUSE_BOOK TO "accountant";
GRANT SELECT ON BSTORE.SHOPPINGBASKET TO "accountant";
--==============================================================================================================================--

-------------
--CUSTOMER
-------------
GRANT "CONNECT","RESOURCE" TO "customer";
GRANT INSERT ON BSTORE.CUSTOMER TO "customer";

ALTER USER "customer" QUOTA 2k ON SALES ;   ---1020B---->2kb
--===================================================================================================================================--

---------------
--publisher
---------------
GRANT "CONNECT","RESOURCE" TO "publisher";
GRANT INSERT ON BSTORE.publisher TO "publisher";

ALTER USER "publisher" QUOTA 2k ON contentcreator ;   ---1026B---->2kb
--===================================================================================================================================--

------------
--author
------------
GRANT "CONNECT","RESOURCE" TO "author";
GRANT INSERT ON BSTORE.author TO "author";

ALTER USER "author" QUOTA 2k ON contentcreator ;   ---771B---->1kb

