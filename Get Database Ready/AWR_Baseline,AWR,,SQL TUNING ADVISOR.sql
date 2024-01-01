--------->>>> AWR_BASELINE <<<<---------
 
. oraenv
sqlplus / as sysdba ;
--------------------------------------------------------------
select snap_id,BEGIN_INTERVAL_TIME,END_INTERVAL_TIME from dba_hist_snapshot where BEGIN_INTERVAL_TIME > systimestamp -1 order by BEGIN_INTERVAL_TIME desc;
--------------------------------------------------------------
EXEC dbms_workload_repository.create_baseline(start_snap_id=>36, end_snap_id=>38, baseline_name=>'First baseline');
---------------------------------------------------------------
select BASELINE_NAME, START_SNAP_ID, END_SNAP_ID from dba_hist_baseline;

---------------------------------------------------------------
--------->> AWR <<< --------------
---------------------------------------------------------------

EXEC DBMS_WORKLOAD_REPOSITORY.create_snapshot;
---------------------------------------------------------------
select snap_id,BEGIN_INTERVAL_TIME,END_INTERVAL_TIME from dba_hist_snapshot where BEGIN_INTERVAL_TIME > systimestamp -1 order by BEGIN_INTERVAL_TIME desc;
---------------------------------------------------------------
--------------------------ON TOAD BSTORE SCHEMA----------

select NAME  ,Email  ,sum(shoppingbasket_book.Count) as total
        from customer  ,shoppingBasket , shoppingBasket_book 
        where Email=customerEmail
        and shoppingBasket.ID = shoppingBasket_ID
        group by NAME ,Email
        order by total desc;
------------------------------------------->>>sqlplus<<<----------------------
EXEC DBMS_WORKLOAD_REPOSITORY.create_snapshot;
---------------------------------------------------------------
select snap_id,BEGIN_INTERVAL_TIME,END_INTERVAL_TIME from dba_hist_snapshot where BEGIN_INTERVAL_TIME > systimestamp -1 order by BEGIN_INTERVAL_TIME desc;
--------------------------------------------------------------
SET LINESIZE 300;
---------------------------------------------------------------
@?/rdbms/admin/awrrpt.sql;
---------------------------------------------------------------
------------>>> SQL TUNING ADVISOR <<<--- -------
-------------------------------------------------
--1- create a SQL Tuning Task: ---------
------------------------------------------------
DECLARE
  v_sql_tune_task_id  VARCHAR2(100);
BEGIN
  v_sql_tune_task_id := DBMS_SQLTUNE.create_tuning_task (
                          begin_snap  => 48,
                          end_snap    => 49,
                          sql_id      => '3ga4fz007nx5y',
                          scope       => DBMS_SQLTUNE.scope_comprehensive,
                          time_limit  => 1000,
                          task_name   => 'test_tuning_task',
                          description => 'Tuning task for the SQL statement with the ID:3ga4fz007nx5y from the AWR');
  DBMS_OUTPUT.put_line('v_sql_tune_task_id: ' || v_sql_tune_task_id);
END
---------------------------------------------------------------
------------ GIVING PRIVILLEGE---------------
----------------------------------------------------TOAD SYS SCHEMA---------
GRANT ADVISOR TO BSTORE;
GRANT SELECT ANY TABLE TO DBA1;
GRANT SELECT ANY DICTIONARY TO DBA1;
--------------------------------------------------------------
--2- generate recommendations: Execute the Tuning Task:----
------------------------------------------------------------

EXEC DBMS_SQLTUNE.EXECUTE_TUNING_TASK('test_tuning_task');

DBMS_SQLTUNE.EXECUTE_TUNING_TASK (
   task_name         IN VARCHAR2,
   execution_name    IN VARCHAR2               := NULL,
   execution_params  IN dbms_advisor.argList   := NULL,
   execution_desc    IN VARCHAR2               := NULL,
   database_link_to  IN VARCHAR2               := NULL)
 RETURN VARCHAR2;
-------------------------------------------------------------------------
-------To see if the same task name exists---------------
-------------------------------------------------------------------------
Select OWNER,TASK_ID,TASK_NAME,ADVISOR_NAME,CREATED,LAST_MODIFIED,LAST_EXECUTION, 
	EXECUTION_TYPE,STATUS,STATUS_MESSAGE,RECOMMENDATION_COUNT from dba_advisor_tasks 
	where ADVISOR_NAME in ('SQL Access Advisor','SQL Tuning Advisor'); 

----------------------------------------------------------------------------------
------3- To see Recommendations from SQL Tuning Advisor----------------
by querying the DBA_ADVISOR_TASKS and DBA_ADVISOR_RECOMMENDATIONS views:
--------------------------------------------------------------------------------
SET LONGCHUNKSIZE 1000000; 
    SET LONG 100000; 
    SET PAGESIZE 1000 
    SET LINESIZE 200 
    SELECT DBMS_SQLTUNE.report_tuning_task('test_tuning_task') as recommendations from dual

-------------------------------------------------------------
-->>>>>>>>>>>> THRESHOLD ON CPU: <<<<<<<<<<<<
-----------------------------------------------------------

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
----------------------------------------------------------------------
SELECT object_name,
       metrics_name,
       warning_operator,
       warning_value,
       critical_operator,
       critical_value
FROM   dba_thresholds
WHERE  object_type = 'SYSTEM'
ORDER BY object_name;
----------------------------------------------------------------------


