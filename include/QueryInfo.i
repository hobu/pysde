class QueryInfo {
  
public: 
%extend {

  QueryInfo() 
       throw( std::string) 
      {
        long result;
        SE_QUERYINFO queryinfo;

        result = SE_queryinfo_create(&queryinfo);
        throw_if_error(result);
        return (QueryInfo*) queryinfo;
    
  };
  
  ~QueryInfo()
  {
    SE_queryinfo_free ((SE_QUERYINFO)self);
  };


  char ** get_columns()
      throw (std::string)
      {
        long result;
        long num_columns;
        char ** columns;
        result = SE_queryinfo_get_columns((SE_QUERYINFO)self, &num_columns, &columns);
        return columns;      
      
  };

  char ** get_tables()
      throw (std::string)
      {
        long result;
        long num_tables;
        char ** tables;
        result = SE_queryinfo_get_tables((SE_QUERYINFO)self, &num_tables, &tables);
        return tables;      
      
  };


  std::string get_logfile() 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_LOGFILE_NAME_LEN);
        result = SE_queryinfo_get_logfile ((SE_QUERYINFO)self, coutput);
        throw_if_error(result);   

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;  
  };

  std::string get_where_clause() 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_LOGFILE_NAME_LEN);
        result = SE_queryinfo_get_where_clause((SE_QUERYINFO)self, coutput);
        throw_if_error(result);   

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;  
  };  

  void set_columns(const CHAR **columns, short num_columns) 
    throw( std::string) 
      {
        long result;
        
        
        result = SE_queryinfo_set_columns ((SE_QUERYINFO)self, (long)num_columns, columns);
        throw_if_error(result);   
      };  

%apply(char **tables) {(const CHAR **tables)};
%apply(char **tables) {(const CHAR **aliases)};

  void set_tables(const CHAR **tables, const CHAR **aliases, long num_tables) 
    throw( std::string) 
      {
        long result;
        
        
        result = SE_queryinfo_set_tables ((SE_QUERYINFO)self, num_tables, tables, aliases);
        throw_if_error(result);   
      };       
%clear(const CHAR **tables);
%clear(const CHAR **aliases);

  void set_where_clause(const char *where_clause) 
    throw( std::string) 
      {
        long result;
        
        
        result = SE_queryinfo_set_where_clause ((SE_QUERYINFO)self, where_clause);
        throw_if_error(result);   
      };     

  void set_logfile(const char *logfile) 
    throw( std::string) 
      {
        long result;
        
        
        result = SE_queryinfo_set_logfile ((SE_QUERYINFO)self, logfile);
        throw_if_error(result);   
      };    
} /* %extend */
}; /* class QueryInfo */