

%{

class DBMS_PROPERTIES {
private:
  long bitfields;
public:
  DBMS_PROPERTIES(long v ) : bitfields(v) {};


 

};
    
%}



class DBMS_PROPERTIES {
public:

%extend {
  //int row_lock_on_insert;
 // int row_lock_on_update;
  
   int DBMS_PROPERTIES_row_lock_on_insert_get() {
    return 0;
    //return self.bitfields & SE_ROW_LOCK_ON_INSERT;
   }

%pythoncode {
  def asList():
    #Do your list conversion thing
}

 } // %extend




};
