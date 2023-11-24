--CREATE TABLE SPACES AND DATA FILES
------------------------------------
------------------------------------

----------------------------
--SALES TABLESPACE
----------------------------
CREATE TABLESPACE sales DATAFILE  --CREATING DATAFILE 
  '+DATA/orcl/salesfile1.dbf' SIZE 132M AUTOEXTEND ON NEXT 132M MAXSIZE 656M 
LOGGING  --FOR REDO LOG
EXTENT MANAGEMENT LOCAL AUTOALLOCATE  --USING AUTOMATIC EXTENT MANAGMENT INSTEAD OF DATA DECTIONARY
BLOCKSIZE 8K  --DETERMINING THE BLOCK SIZE SAME AS DEFAULT VALUE
SEGMENT SPACE MANAGEMENT AUTO  --USING AUTOMATIC SEGMENT MANAGMENT INSTEAD OF DATA DECTIONARY
FLASHBACK ON;  --ALLOWING FLASHBACK
--==========================================================================--

------------------------------
--warehouse TABLESPACE
-----------------------------
CREATE TABLESPACE warehouse DATAFILE 
  '+DATA/orcl/warehousefile2.dbf' SIZE 55M AUTOEXTEND ON NEXT 55M MAXSIZE 270M 
LOGGING
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;
--==========================================================================--

------------------------------
--book TABLESPACE
-----------------------------
CREATE TABLESPACE Book DATAFILE 
  '+DATA/orcl/bookfile1.dbf' SIZE 30M AUTOEXTEND ON NEXT 30M MAXSIZE 145M 
LOGGING 
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;
--==========================================================================--

---------------------------------
--ContentCreator TABLESPACE
---------------------------------
CREATE TABLESPACE ContentCreator DATAFILE 
  '+DATA/orcl/ContentCreatorfile1.dbf' SIZE 180M AUTOEXTEND ON NEXT 180M MAXSIZE 900M 
LOGGING
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;