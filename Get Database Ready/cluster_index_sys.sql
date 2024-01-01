--########## ON SYS SCHEMA EDITOR ###############

GRANT CREATE CLUSTER TO "BSTORE";      
------------------------------------------------------CHECK FOR CLUSTER
SELECT * FROM DBA_INDEXES;

SELECT * FROM DBA_CLUSTERING_TABLES;
------------------------------------------------------TEST
---### ON BSTORE SCHEMA EDITOR ###---
 select WAREHOUSE.PHONE, WAREHOUSE.ADDRESS, warehouse_book.bookisbn, warehouse_book.count, book.title
        from  book join warehouse_book
        on bookisbn=isbn
        join warehouse 
        on WAREHOUSE_BOOK.WAREHOUSECODE=warehouse.code
        where warehouse.code=4;
        
 -----------------------------------------------Create cluster with parameters 
CREATE CLUSTER warehouse_cluster3
( code  NUMBER(10), ISBN NUMBER(10) )
SIZE 8
STORAGE (initial 100K next 50K);
----------------------------------------------------Create cluster index --

CREATE INDEX idx_warehouse3 ON CLUSTER warehouse_cluster3;

------------------------------------------------Adding tables to  cluster--
CREATE TABLE warehouse_cluster_table
   CLUSTER warehouse_cluster3 (code)
   AS SELECT * FROM WAREHOUSE;

CREATE TABLE warehousebook_cluster_table
   CLUSTER warehouse_cluster3 (warehousecode)
   AS SELECT * FROM WAREHOUSE_BOOK;
   
 CREATE TABLE book_cluster_table
   CLUSTER warehouse_cluster3 (ISBN)
   AS SELECT * FROM BOOK ;

 --------------------------------------------------------
 --######## VIEW EXCECUTION PLAN ############

EXPLAIN PLAN FOR
---- SQL STATEMENT----
select * from warehouse_cluster_table where code = 10;
    
select plan_table_output from table(dbms_xplan.display('plan_table',null,'basic'));





