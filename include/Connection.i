
class Connection {
  
public: 
%extend {



  Connection( const char *server,
              const char *instance,
              const char *database,
              const char *username,
              const char *password) 
       throw( std::string) 
      {
        long result;
        SE_CONNECTION connection;
        SE_ERROR error;

        result = SE_connection_create (server,
                                       instance,
                                       database,
                                       username,
                                       password,
                                       &error,
                                       &connection);
               
        throw_if_error(result);
        return (Connection*) connection;
    
  };
  
  ~Connection()
  {
    SE_connection_free ((SE_CONNECTION)self);
  };
  
  std::string get_instance_name() 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_MESSAGE_LENGTH);
        result = SE_connection_get_instance_name ((SE_CONNECTION)self, coutput);
        throw_if_error(result);   

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;
      };

  std::string get_server_name() 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_MESSAGE_LENGTH);
        result = SE_connection_get_server_name ((SE_CONNECTION)self, coutput);
        throw_if_error(result);     

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;
      };
 
  std::string get_user_name() 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_MESSAGE_LENGTH);
        result = SE_connection_get_user_name ((SE_CONNECTION)self, coutput);
        throw_if_error(result);   

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;
      };  

  std::string get_admin_database() 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_MESSAGE_LENGTH);
        result = SE_connection_get_admin_database ((SE_CONNECTION)self, coutput);
        throw_if_error(result);   

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;
      }; 

  void disable_tlm_check() 
    throw( std::string) 
      {
        long result;

        result = SE_connection_disable_tlm_check ((SE_CONNECTION)self);
        throw_if_error(result);   

      };

  void enable_tlm_check() 
    throw( std::string) 
      {
        long result;

        result = SE_connection_enable_tlm_check ((SE_CONNECTION)self);
        throw_if_error(result);   

      }; 

  void free_all_locks() 
    throw( std::string) 
      {
        long result;

        result = SE_connection_free_all_locks ((SE_CONNECTION)self);
        throw_if_error(result);   

      }; 
      
  void export_dbtune(const char* dbtune_file) 
    throw( std::string) 
      {
        long result;

        result = SE_connection_export_dbtune ((SE_CONNECTION)self, dbtune_file);
        throw_if_error(result);   

      }; 
  

  long get_dbms_info( long *id, long *properties) 
    throw( std::string) 
      {
        long result;

        result = SE_connection_get_dbms_info ((SE_CONNECTION)self, id, properties);
        throw_if_error(result);   
        return *id;

      };            

  std::string get_error_string(long error_code) 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_MESSAGE_LENGTH);
        result = SE_connection_get_error_string ((SE_CONNECTION)self, error_code, coutput);
        throw_if_error(result);   

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;
      };   
      
  SE_ERROR get_ext_error_string() 
    throw( std::string) 
      {
        long result;
        SE_ERROR terror;

        result = SE_connection_get_ext_error ((SE_CONNECTION)self, &terror);
        throw_if_error(result);   

        return (SE_ERROR)terror;
      };   

  void get_instance_layerlocks( SE_INSTANCE_LOCK **lock_list_addr, LONG* lock_list_count ) 
    throw( std::string) 
      {
        long result;
        result = SE_connection_get_instance_layerlocks ((SE_CONNECTION)self, lock_list_addr, lock_list_count);
        throw_if_error(result);   
      };  
 
  void get_instance_objectlocks( SE_OBJECTLOCKINFO **lock_list_addr, LONG *lock_list_count ) 
    throw( std::string) 
      {
        long result;
        result = SE_connection_get_instance_objectlocks ((SE_CONNECTION)self, lock_list_addr, lock_list_count);
        throw_if_error(result);   
      }; 

  void get_instance_statelocks( SE_INSTANCE_STATE_LOCK **lock_list_addr, LONG *lock_list_count ) 
    throw( std::string) 
      {
        long result;
        result = SE_connection_get_instance_statelocks ((SE_CONNECTION)self, lock_list_addr, lock_list_count);
        throw_if_error(result);   
      }; 


           
  long lock_layer( const char *table, const char *column, long lock_mode) 
    throw( std::string) 
      {
        long result;
        result = SE_layer_lock ((SE_CONNECTION) self, table, column, lock_mode);
        throw_if_error(result);   
        if (!result) {
          return 1;
        } else {
          return 0;
        }
      };      

  void set_concurrency(long policy) 
    throw( std::string) 
      {
        long result;

        result = SE_connection_set_concurrency  ((SE_CONNECTION)self, policy);
        throw_if_error(result);   

      }; 

  void set_stream_spec(SE_STREAM_SPEC *spec) 
    throw( std::string) 
      {
        long result;

        result = SE_connection_set_stream_spec  ((SE_CONNECTION)self, spec);
        throw_if_error(result);   

      }; 

  SE_STREAM_SPEC get_stream_spec() 
    throw( std::string) 
      {
        long result;
        SE_STREAM_SPEC spec;

        result = SE_connection_get_stream_spec ((SE_CONNECTION)self, &spec);
        throw_if_error(result);   

        return (SE_STREAM_SPEC)spec;
      };       

  void set_transaction_autocommit(long interval) 
    throw( std::string) 
      {
        long result;

        result = SE_connection_set_transaction_autocommit ((SE_CONNECTION)self, interval);
        throw_if_error(result);   

      }; 

  long get_transaction_autocommit() 
    throw( std::string) 
      {
        long result;
        long interval;

        result = SE_connection_get_transaction_autocommit ((SE_CONNECTION)self, &interval);
        throw_if_error(result);   

        return interval;
      }; 

  long get_server_time() 
      {
        long result;

        result = SE_connection_get_server_time ((SE_CONNECTION)self); 

        return result;
      };  

  void get_keyword_info( CHAR ***keyword_list, LONG *keyword_count ) 
    throw( std::string) 
      {
        long result;
        
        
        result = SE_connection_get_keyword_info ((SE_CONNECTION)self, keyword_count, keyword_list);
        throw_if_error(result);   
      }; 

  void rollback_transaction( ) 
    throw( std::string) 
      {
        long result;
        
        
        result = SE_connection_rollback_transaction ((SE_CONNECTION)self);
        throw_if_error(result);   
      }; 

  void commit_transaction() 
    throw( std::string) 
      {
        long result;

        result = SE_connection_commit_transaction ((SE_CONNECTION)self);
        throw_if_error(result);   

      };
      
  void start_transaction() 
    throw( std::string) 
      {
        long result;

        result = SE_connection_start_transaction ((SE_CONNECTION)self);
        throw_if_error(result);   

      };

  SE_RELEASE get_release() 
    throw( std::string) 
      {
        long result;
        SE_RELEASE release;

        result = SE_connection_get_release ((SE_CONNECTION)self, &release);
        throw_if_error(result);   

        return (SE_RELEASE)release;
      }; 

  SE_INSTANCE_STATUS get_instance_status() 
    throw( std::string) 
      {
        long result;
        SE_INSTANCE_STATUS status;

        result = SE_connection_get_instance_status  ((SE_CONNECTION)self, &status);
        throw_if_error(result);   

        return (SE_INSTANCE_STATUS)status;
      };        
                             
} /* %extend */
}; /* class Connection */

SE_layer_lock (SE_CONNECTION connection, const char *table, const char *column, long lock_mode);
