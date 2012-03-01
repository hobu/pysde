class Coordref {
  
public: 
%extend {

  Coordref() 
       throw( std::string) 
      {
        long result;
        SE_COORDREF coordref;

        result = SE_coordref_create(&coordref);
        throw_if_error(result);
        return (Coordref*) coordref;
    
  };
  
  ~Coordref()
  {
    SE_coordref_free ((SE_COORDREF)self);
  };

  Coordref* duplicate() 
    throw( std::string) 
      {
        long result;
        SE_COORDREF tgt_coordref;
        result = SE_coordref_create(&tgt_coordref);
        throw_if_error(result); 
        result = SE_coordref_duplicate ((SE_COORDREF)self, tgt_coordref);
        throw_if_error(result);   

        return (Coordref*)tgt_coordref;
      };

  CoordSys* get_coordsys() 
    throw( std::string) 
      {
        long result;
        PE_COORDSYS coordsys;
        result = SE_coordref_get_coordsys ((SE_COORDREF)self, &coordsys);
        throw_if_error(result);   

        return (CoordSys*)coordsys;
      };         

  std::string get_description() 
    throw( std::string) 
      {
        long result;
        char * coutput = (char*) malloc(SE_MAX_SPATIALREF_SRTEXT_LEN);
        result = SE_coordref_get_description ((SE_COORDREF)self, coutput);
        throw_if_error(result);   

        std::string output;
        output = std::string(coutput);
        free(coutput);
        return output;
      };      

  long get_id( ) 
    throw( std::string) 
      {
        long result;
        long id;

        result = SE_coordref_get_id((SE_COORDREF)self, &id);
        throw_if_error(result);   
        return id;

      };
  double get_m_falsem()
    throw( std::string) 
      {
        long result;
        double falsem;
        double munits;


        result = SE_coordref_get_m((SE_COORDREF)self, &falsem, &munits);
        throw_if_error(result);   

        return falsem;

      };

  double get_m_munits()
    throw( std::string) 
      {
        long result;
        double falsem;
        double munits;


        result = SE_coordref_get_m((SE_COORDREF)self, &falsem, &munits);
        throw_if_error(result);   

        return munits;

      };      

  double get_m_range_min_value()
    throw( std::string) 
      {
        long result;
        double min_value;
        double max_value;


        result = SE_coordref_get_m_range((SE_COORDREF)self, &min_value, &max_value);
        throw_if_error(result);   

        return min_value;

      }; 

  double get_m_range_max_value()
    throw( std::string) 
      {
        long result;
        double min_value;
        double max_value;


        result = SE_coordref_get_m_range((SE_COORDREF)self, &min_value, &max_value);
        throw_if_error(result);   

        return max_value;

      };       

  double get_xy_falsex()
    throw( std::string) 
      {
        long result;
        double falsex;
        double falsey;
        double xyunits;
        
        result = SE_coordref_get_xy((SE_COORDREF)self, &falsex, &falsey, &xyunits);
        throw_if_error(result);   

        return falsex;

      };       

  double get_xy_falsey()
    throw( std::string) 
      {
        long result;
        double falsex;
        double falsey;
        double xyunits;
        
        result = SE_coordref_get_xy((SE_COORDREF)self, &falsex, &falsey, &xyunits);
        throw_if_error(result);   

        return falsey;

      };       

  double get_xy_xyunits()
    throw( std::string) 
      {
        long result;
        double falsex;
        double falsey;
        double xyunits;
        
        result = SE_coordref_get_xy((SE_COORDREF)self, &falsex, &falsey, &xyunits);
        throw_if_error(result);   

        return xyunits;

      };       

  SE_ENVELOPE get_xy_envelope()
    throw( std::string) 
      {
        long result;
        SE_ENVELOPE envelope;
        
        result = SE_coordref_get_xy_envelope((SE_COORDREF)self, &envelope);
        throw_if_error(result);   

        return  envelope;

      };        

  double get_z_falsez()
    throw( std::string) 
      {
        long result;
        double falsez;
        double zunits;


        result = SE_coordref_get_m((SE_COORDREF)self, &falsez, &zunits);
        throw_if_error(result);   

        return falsez;

      };

  double get_z_zunits()
    throw( std::string) 
      {
        long result;
        double falsez;
        double zunits;


        result = SE_coordref_get_z((SE_COORDREF)self, &falsez, &zunits);
        throw_if_error(result);   

        return zunits;

      };      

  double get_z_range_min_value()
    throw( std::string) 
      {
        long result;
        double min_value;
        double max_value;


        result = SE_coordref_get_z_range((SE_COORDREF)self, &min_value, &max_value);
        throw_if_error(result);   

        return min_value;

      }; 

  double get_z_range_max_value()
    throw( std::string) 
      {
        long result;
        double min_value;
        double max_value;


        result = SE_coordref_get_z_range((SE_COORDREF)self, &min_value, &max_value);
        throw_if_error(result);   

        return max_value;

      }; 

  void set_by_description(const char *description) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_by_description ((SE_COORDREF)self, description);
        throw_if_error(result);   

      }; 

  void set_by_id(long coordsys_id) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_by_id ((SE_COORDREF)self, coordsys_id);
        throw_if_error(result);   

      }; 

  void set_coordsys(CoordSys *cs) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_coordsys((SE_COORDREF)self, (PE_COORDSYS)cs);
        throw_if_error(result);   

      }; 

  void set_m(double falsem, double munits) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_m((SE_COORDREF)self, falsem, munits);
        throw_if_error(result);   

      };       

  void set_m_by_range(double min_mvalue, double max_mvalue) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_m_by_range((SE_COORDREF)self, min_mvalue, max_mvalue);
        throw_if_error(result);   

      };       

  void set_xy(double falsex, double falsey, double xyunits) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_xy((SE_COORDREF)self, falsex, falsey, xyunits);
        throw_if_error(result);   

      };  

  void set_xy_by_envelope(SE_ENVELOPE* envelope) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_xy_by_envelope((SE_COORDREF)self, envelope);
        throw_if_error(result);   

      }; 
  void set_z(double falsez, double zunits) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_z((SE_COORDREF)self, falsez, zunits);
        throw_if_error(result);   

      };       

  void set_z_by_range(double min_zvalue, double max_zvalue) 
    throw( std::string) 
      {
        long result;

        result = SE_coordref_set_z_by_range((SE_COORDREF)self, min_zvalue, max_zvalue);
        throw_if_error(result);   

      }; 

} /* %extend */
}; /* class Coordref */