--CREATE PROFILES
--------------------------
--------------------------

------------------------------------
--first group
--developer accountant data analyst
------------------------------------- 
CREATE PROFILE "EMPLOYEES" LIMIT CPU_PER_SESSION DEFAULT
PASSWORD_LIFE_TIME 90
FAILED_LOGIN_ATTEMPTS 3
SESSIONS_PER_USER 2;
--============================================================--

------------------------------------
--second group
--customer author publisher 
------------------------------------
CREATE PROFILE "USERS" LIMIT CPU_PER_SESSION DEFAULT
PASSWORD_LIFE_TIME 120
FAILED_LOGIN_ATTEMPTS 2
SESSIONS_PER_USER 1;
--=============================================================--

--------------------------------------------------
--third group
--warehouse manager salesmanager owner
--------------------------------------------------- 
CREATE PROFILE "MANAGERS" LIMIT CPU_PER_SESSION DEFAULT
PASSWORD_LIFE_TIME 70
FAILED_LOGIN_ATTEMPTS 3
SESSIONS_PER_USER 2;
--=============================================================--

-----------------------------------------------
--forth group
--database admins
------------------------------------------------
CREATE PROFILE "DBAS" LIMIT CPU_PER_SESSION DEFAULT
PASSWORD_LIFE_TIME 60
FAILED_LOGIN_ATTEMPTS 3
SESSIONS_PER_USER 2;
