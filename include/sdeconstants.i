%module sdeconstants

/**********************************/
/*****   DBMS IDENTIFIERS *********/
/**********************************/
#define SE_DBMS_IS_UNKNOWN  -1
#define SE_DBMS_IS_OTHER     0
#define SE_DBMS_IS_ORACLE    1
#define SE_DBMS_IS_INFORMIX  2
#define SE_DBMS_IS_SYBASE    3
#define SE_DBMS_IS_DB2       4
#define SE_DBMS_IS_SQLSERVER 5
#define SE_DBMS_IS_ARCINFO   6
#define SE_DBMS_IS_IUS       7
#define SE_DBMS_IS_DB2_EXT   8
#define SE_DBMS_IS_ARCSERVER 9
#define SE_DBMS_IS_JET       10

/************************************************************
*** CONCURRENCY POLICIES
************************************************************/
#define SE_UNPROTECTED_POLICY  0
#define SE_ONE_THREAD_POLICY   1
#define SE_TRYLOCK_POLICY      2
#define SE_LOCK_POLICY         3

/****************************************************************************/
/***  INSTANCE MODES -- Returned in system_mode field of SE_INSTANCE_STATUS */
/****************************************************************************/
#define SE_INSTANCE_ACCEPTING     1
#define SE_INSTANCE_BLOCKING      2