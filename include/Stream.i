class Stream {
  
public: 
%extend {

  Stream(Connection* connection) 
       throw( std::string) 
      {
        long result;
        SE_STREAM stream;

        result = SE_stream_create((SE_CONNECTION) connection, 
                                   &stream);
        throw_if_error(result);
        return (Stream*) stream;
    
  };
  
  ~Stream()
  {
    SE_stream_free ((SE_STREAM)self);
  };

  void close(int reset) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_close ((SE_STREAM)self, 
                                  (BOOL) reset );
        throw_if_error(result);   

      }; 

  void execute() 
    throw( std::string) 
      {
        long result;

        result = SE_stream_execute ((SE_STREAM)self );
        throw_if_error(result);   

      }; 

  long fetch() 
    throw( std::string) 
      {
        long result;

        result = SE_stream_fetch ((SE_STREAM)self );
        if (result == SE_SUCCESS || result == SE_FINISHED)
           return result;
        else
           return -51;
           
        throw_if_error(result);;   

      };

  void flush_buffered_writes() 
    throw( std::string) 
      {
        long result;

        result = SE_stream_flush_buffered_writes ((SE_STREAM)self );
        throw_if_error(result);   

      };
      
  void delete_row(const char *table, long row_id) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_delete_row ((SE_STREAM)self,
                                        table,
                                        row_id );
        throw_if_error(result);   

      };  
      
  void delete_from_table(const char *table, const char *where_clause) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_delete_from_table ((SE_STREAM)self,
                                               table,
                                               where_clause );
        throw_if_error(result);   

      };

      
  SE_COLUMN_DEF describe_column(short column_number) 
    throw( std::string) 
      {
        long result;
        SE_COLUMN_DEF definition;

        result = SE_stream_describe_column ((SE_STREAM)self,
                                             column_number,
                                             &definition );
        throw_if_error(result);   
        
        return (SE_COLUMN_DEF) definition;

      };

  SE_BLOB_INFO get_blob(short column_number) 
    throw( std::string) 
      {
        long result;
        SE_BLOB_INFO blob;

        result = SE_stream_get_blob ((SE_STREAM)self,
                                      column_number,
                                      &blob );
        throw_if_error(result);   
        
        return (SE_BLOB_INFO) blob;

      };

  tm get_date(short column_number) 
    throw( std::string) 
      {
        long result;
        tm date_val;

        result = SE_stream_get_date ((SE_STREAM)self,
                                      column_number,
                                      &date_val );
        throw_if_error(result);   
        
        return (tm) date_val;

      };

  double get_double(short column_number) 
    throw( std::string) 
      {
        long result;
        double double_val;

        result = SE_stream_get_double ((SE_STREAM)self,
                                        column_number,
                                        &double_val );
        throw_if_error(result);   
        
        return double_val;

      };

  SE_ERROR get_ext_error() 
    throw( std::string) 
      {
        long result;
        SE_ERROR error;

        result = SE_stream_get_ext_error ((SE_STREAM)self,
                                           &error );
        throw_if_error(result);   
        
        return (SE_ERROR) error;

      };

  float get_float(short column_number) 
    throw( std::string) 
      {
        long result;
        float float_val;

        result = SE_stream_get_float ((SE_STREAM)self,
                                       column_number,
                                       &float_val );
        throw_if_error(result);   
        
        return float_val;

      };

  long get_integer(short column_number) 
    throw( std::string) 
      {
        long result;
        long long_val;

        result = SE_stream_get_integer ((SE_STREAM)self,
                                         column_number,
                                         &long_val );
        throw_if_error(result);   
        
        return long_val;

      };

  Shape *get_shape(short column_number) 
    throw( std::string) 
      {
        long result;
        SE_SHAPE shape_val;
        SE_COORDREF coordref;
        result = SE_coordref_create (&coordref);
        result = SE_shape_create(coordref, &shape_val);

        result = SE_stream_get_shape ((SE_STREAM)self,
                                       column_number,
                                       shape_val );
        throw_if_error(result);   
        
        return (Shape*) shape_val;

      };      

  short get_smallint(short column_number) 
    throw( std::string) 
      {
        long result;
        short short_val;

        result = SE_stream_get_smallint ((SE_STREAM)self,
                                         column_number,
                                         &short_val );
        throw_if_error(result);   
        
        return short_val;

      };

  std::string get_string(short column_number, int column_length=0) 
    throw( std::string) 
      {
        long result;
        char * string_val;
        
        // If we were given a column length, use that for 
        // allocation, otherwise, just give it a big number and 
        // hope we don't blow up.
        if (column_length > 0)
        {
          string_val = (char*) malloc(column_length+1);
        }
        else
        {
          string_val = (char*) malloc(600);
        }

        result = SE_stream_get_string ((SE_STREAM)self,
                                         column_number,
                                         string_val );
        throw_if_error(result);   
        
        std::string output;
        output = std::string(string_val);
        free(string_val);
        return output;        

      };

  long in_progress() 
    throw( std::string) 
      {
        long result;
        int progress;

        result = SE_stream_in_progress ((SE_STREAM)self,
                                         &progress );
        throw_if_error(result);   
        return progress;

      }; 

  long last_inserted_row_id() 
    throw( std::string) 
      {
        long result;
        long row_id;

        result = SE_stream_last_inserted_row_id ((SE_STREAM)self,
                                         &row_id );
        throw_if_error(result);   
        return row_id;

      }; 

  void prepare_sql(const char *sql_statement) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_prepare_sql ((SE_STREAM)self,
                                         sql_statement );
        throw_if_error(result);   

      };

  void set_blob(short column_number, const SE_BLOB_INFO *blob) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_blob ((SE_STREAM)self,
                                      column_number,
                                      blob );
        throw_if_error(result);   

      };

  void set_date(short column_number, const struct tm *date) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_date ((SE_STREAM)self,
                                      column_number,
                                      date );
        throw_if_error(result);   

      };   

  void set_double(short column_number, const double *double_val) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_double ((SE_STREAM)self,
                                      column_number,
                                      double_val );
        throw_if_error(result);   

      };      

  void set_float(short column_number, const float *float_val) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_float ((SE_STREAM)self,
                                      column_number,
                                      float_val );
        throw_if_error(result);   

      };         

  void set_integer(short column_number, const long *int_val) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_integer ((SE_STREAM)self,
                                      column_number,
                                      int_val );
        throw_if_error(result);   

      };    

  void set_shape(short column_number, const SE_SHAPE shape_val) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_shape ((SE_STREAM)self,
                                      column_number,
                                      shape_val );
        throw_if_error(result);   

      };          

  void set_smallint(short column_number, const short *short_val) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_smallint ((SE_STREAM)self,
                                      column_number,
                                      short_val );
        throw_if_error(result);   

      };          

  void set_string(short column_number, const char *string_val) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_string ((SE_STREAM)self,
                                      column_number,
                                      string_val );
        throw_if_error(result);   

      };  

  void set_write_mode(int buffered) 
    throw( std::string) 
      {
        long result;

        result = SE_stream_set_write_mode ((SE_STREAM)self,
                                           buffered);
        throw_if_error(result);   

      };  

  void query(const SE_SQL_CONSTRUCT *construct, const CHAR **columns, short num_columns) 
    throw( std::string) 
      {
        long result;
        result = 0;
        result = SE_stream_query ((SE_STREAM)self,
                                           num_columns,
                                           columns,
                                           construct);
        throw_if_error(result);   

      };        
      
  Connection *get_connection()
    throw( std::string) 
      {
        long result;
        SE_CONNECTION connection;

        result = SE_stream_get_connection ((SE_STREAM)self,
                                       &connection );
        throw_if_error(result);   
        
        return (Connection*) connection;      
      };

         
      
} /* %extend */
}; /* class Stream */