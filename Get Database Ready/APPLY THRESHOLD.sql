--APPLY THRESHOLD
-------------------------
------------------------

----------------------------------------
--BOOK TABLESPACE
----------------------------------------
BEGIN
    DBMS_SERVER_ALERT.SET_THRESHOLD(
        metrics_id => DBMS_SERVER_ALERT.TABLESPACE_PCT_FULL,
        warning_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        warning_value => '80',
        critical_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        critical_value => '90',
        observation_period => 1,
        consecutive_occurrences => 3,
        instance_name => 'ORCL',
        object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_TABLESPACE,
        object_name => 'BOOK'
     );
END;
--===================================================================================--

--------------------------------------
--SALES TABLESPACE
--------------------------------------
BEGIN
    DBMS_SERVER_ALERT.SET_THRESHOLD(
        metrics_id => DBMS_SERVER_ALERT.TABLESPACE_PCT_FULL,
        warning_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        warning_value => '80',
        critical_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        critical_value => '90',
        observation_period => 1,
        consecutive_occurrences => 3,
        instance_name => 'ORCL',
        object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_TABLESPACE,
        object_name => 'SALES'
     );
END;
--==========================================================================================--

------------------------------------------
--WAREHOUSE TABLESPACE
------------------------------------------
BEGIN
    DBMS_SERVER_ALERT.SET_THRESHOLD(
        metrics_id => DBMS_SERVER_ALERT.TABLESPACE_PCT_FULL,
        warning_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        warning_value => '80',
        critical_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        critical_value => '90',
        observation_period => 1,
        consecutive_occurrences => 3,
        instance_name => 'ORCL',
        object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_TABLESPACE,
        object_name => 'WAREHOUSE'
     );
END;
--=============================================================================================--

----------------------------------
--CONTENTCREATOR TABLESPACE
----------------------------------
BEGIN
    DBMS_SERVER_ALERT.SET_THRESHOLD(
        metrics_id => DBMS_SERVER_ALERT.TABLESPACE_PCT_FULL,
        warning_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        warning_value => '80',
        critical_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        critical_value => '90',
        observation_period => 1,
        consecutive_occurrences => 3,
        instance_name => 'ORCL',
        object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_TABLESPACE,
        object_name => 'CONTENTCREATOR'
     );
END;
--****************************************************************************************************************************--

-----------------------------
--CPU TIME
----------------------------
BEGIN
    DBMS_SERVER_ALERT.SET_THRESHOLD(
        metrics_id => DBMS_SERVER_ALERT.DATABASE_CPU_TIME,
        warning_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        warning_value => '75',
        critical_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        critical_value => '85',
        observation_period => 20,
        consecutive_occurrences => 2,
        instance_name => 'ORCL',
        object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_SYSTEM,
        object_name => NULL
     );
END;
