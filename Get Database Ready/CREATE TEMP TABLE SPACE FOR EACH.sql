--CREATE TEMP TABLE SPACE FOR EACH PROFILE
-------------------------------------------
-------------------------------------------

----------------------------------
--FOR EMPLOYEES PROFILE
-----------------------------------
create temporary tablespace temp1 tempfile '+FRA/ORCL/TEMPFILE/temp1' size 10M;
--===============================================================================--

----------------------------------
--FOR USERS PROFILE
-----------------------------------
create temporary tablespace temp2 tempfile '+FRA/ORCL/TEMPFILE/temp2' size 10M;
--================================================================================--

----------------------------------
--FOR MANAGERS PROFILE
-----------------------------------
create temporary tablespace temp3 tempfile '+FRA/ORCL/TEMPFILE/temp3' size 10M;
--==================================================================================--

----------------------------------
--FOR DBAS PROFILE
-----------------------------------
create temporary tablespace temp4 tempfile '+FRA/ORCL/TEMPFILE/temp4' size 10M;

