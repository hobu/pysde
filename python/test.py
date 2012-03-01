import os
import sys
import time

import sde
import sdeconstants

import unittest


server = 'server'
port = '5151'
database = ''
username = 'username'
passwd = 'password'
badpw = 'badpassword'
admin_database='sde_master'

major = 9
minor = 0
bug = 0
desc = 'SQL Server  Build 1970(SQL Server) Mon Jan 31 18:13:12 PST 2005'
release_ver = 90003
rel_low_supported = 0

con = sde.Connection(server, port, database, username, passwd)
writecon = sde.Connection(server, port, database, 'geoservwrite', '!sdeGeoWrite')

##class ConnectionTest(unittest.TestCase):
##    def testBadLogin(self):
##        """A bad login raises the proper error"""
##        self.assertRaises(RuntimeError,
##                          sde.Connection,
##                          server, port, database, username, badpw)
##    def testBadPort(self):
##        """Instance parameter given as an integer raises the proper error"""
##        self.assertRaises(TypeError,
##                          sde.Connection,
##                          server, 5151, database, username, badpw)   
##    def testGoodConnection(self):
##        """Instance parameters for a good connection are correct"""
##        assert con.get_instance_name() == port
##        assert con.get_server_name() == server
##        assert con.get_user_name() == username.upper()
##        assert con.get_admin_database() == admin_database
##    def testGoodCommit(self):
##        """Commit transaction doesn't throw an error"""
##        con.commit_transaction()       
##    def testSwitchTLMChecks(self):
##        """Time switching of last modified checks enforcement """
##        con.enable_tlm_check() 
##        con.disable_tlm_check() 
##    def testFreeConnectionLocks(self):
##        """Connection can free its locks"""
##        con.free_all_locks()
##    def testGetServerInfo(self):
##        """Is the server we are connecting to really MS SQL Server?"""
##        assert con.get_dbms_info()[0] == sdeconstants.SE_DBMS_IS_SQLSERVER
##    def testGetErrorString(self):
##        """Can we return the proper error codes from the Connection object?"""
##        message = 'Coordinate path not found in shape'
##        assert con.get_error_string(-94) == message
##        assert con.get_ext_error_string().sde_error == 0
##    def testLayerLocks(self):
##        """Layer locks check"""
##        writecon.lock_layer('sde_master.GEOSERVWRITE.US_COUNTIES_ALBERS','SHAPE',1)
##        lock = con.get_instance_layerlocks()[0]
##        assert lock.layer_id == 3
##        writecon.free_all_locks()
##        assert len(con.get_instance_layerlocks()) == 0
##    def testConcurrency(self):
##        """Cycle through concurrency options"""
##        con.set_concurrency(sdeconstants.SE_UNPROTECTED_POLICY)
##        con.set_concurrency(sdeconstants.SE_ONE_THREAD_POLICY)   
##        con.set_concurrency(sdeconstants.SE_TRYLOCK_POLICY)
##        con.set_concurrency(sdeconstants.SE_LOCK_POLICY)
##    def testStreamSpec(self):
##        """Test stream spec properties"""
##        spec = con.get_stream_spec()
##        spec.stream_pool_size = 8
##        con.set_stream_spec(spec)
##        spec2 =  con.get_stream_spec()
##        assert spec2.stream_pool_size == spec.stream_pool_size
##    def testAutoCommit(self):
##        """Setting and getting autocommit intervals"""
##        interval = con.get_transaction_autocommit()
##        con.set_transaction_autocommit(interval+3)
##        assert con.get_transaction_autocommit() == interval+3
##    def testServerTime(self):
##        """Server time vs. local time is within 1000 seconds"""
##        server_time = con.get_server_time()
##        local_time = time.time()
##        assert abs(local_time - server_time) < 1000
##    def testReleaseInfo(self):
##        """Verifying server release information"""
##        release = con.get_release()
##        assert release.major == major
##        assert release.minor == minor
##        assert release.bug == bug
##        assert release.desc == desc
##        assert release.release == release_ver
##        assert release.rel_low_supported == rel_low_supported
##    def testDBMSKeywords(self):
##        """We're returning the right number of DBMS keywords"""
##        assert len(con.get_keyword_info()) == 202
##    def testTransactionSemantics(self):
##        """Transaction semantics work right"""
##        con.start_transaction()
##        con.rollback_transaction()
##        con.commit_transaction()
##    def testInstanceStatus(self):
##        """Instance status info """
##        status = con.get_instance_status()
##        version = status.version
##        assert version.major == major
##        assert version.minor == minor
##        assert version.bug == bug 
##       #assert version.desc == desc #won't be the same
##        assert version.release == release_ver
##        assert version.rel_low_supported == rel_low_supported
##        assert status.system_mode == sdeconstants.SE_INSTANCE_ACCEPTING

class QueryInfo(unittest.TestCase):
    def testSetColumns(self):
        """Setting columns"""
        qi = sde.QueryInfo()
        inlist = ['a','b','c']
        qi.set_columns(inlist)
        assert qi.get_columns() == inlist
    def testSetTables(self):
        """Setting Tables"""
        qi = sde.QueryInfo()
        tables = ['a','b','c']
        aliases = ['aa','bb','cc']
        mixed = []
        for j in tables:
            mixed.append(j+' ' +aliases[tables.index(j)])
        qi.set_tables(tables, [], len(tables))
        assert qi.get_tables() == tables
        qi.set_tables(tables, aliases, len(tables))
        assert qi.get_tables() == mixed
    def testWhere(self):
        """Where statement"""
        qi = sde.QueryInfo()
        where = "THE WHERE STATEMENT"
        qi.set_where_clause(where)
        assert qi.get_where_clause() == where
    def testLogfile(self):
        """Logfile"""
        qi = sde.QueryInfo()
        logfile = 'THE LOGFILE'
        qi.set_logfile(logfile)
        assert qi.get_logfile() == logfile
suite = unittest.TestSuite()
#suite.addTests([ConnectionTest])
if __name__=='__main__':
    #print dir(sde)
    #print dir(sdeconstants)
    unittest.main()