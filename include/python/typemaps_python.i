#ifdef SWIGPYTHON
%include "typemaps.i"

%typemap(in,numinputs=0) ( long *id, long *properties) ( long tmpval, long tmphasval ) {
  /* %typemap(python,in,numinputs=0) (long *id, long *properties) */
  $1 = &tmpval;
  $2 = &tmphasval;
}

%typemap(argout) ( long *id, long *properties) 
{
  /* %typemap(argout) long *id, long *properties */

            PyObject *resultlist, *id, *properties;
            resultlist = PyTuple_New(2);
            id = PyInt_FromLong(*$1);
            PyTuple_SetItem(resultlist, 0, id);
            properties =PyInt_FromLong(*$2);
            PyTuple_SetItem(resultlist, 1, properties);
            $result = resultlist;
            return resultlist;
}


%define TYPE_LONG_MACRO( TheType )
%typemap(in,numinputs=0) ( TheType **lock_list_addr, LONG* lock_list_count) ( TheType *tmp_lock_list_addr, LONG tmp_lock_list_count) {
  // %typemap(python,in,numinputs=0) (TheType **lock_list_addr, LONG* lock_list_count) 
  // 
 
  $1 = &tmp_lock_list_addr;
  $2 = &tmp_lock_list_count;
}

%typemap(argout) ( TheType **lock_list_addr, LONG* lock_list_count) 
{
  /* %typemap(out) TheType *lock_list_addr */
            int i,imax;
            PyObject *resultlist, *res;
            imax = (int)*$2;
            resultlist = PyTuple_New(imax);
            for (i = 0; i < imax; i++) { 
              res = SWIG_NewPointerObj((void*)$1[i], $*1_descriptor, 1); 
              PyTuple_SetItem(resultlist, i, res);
            }

            $result = resultlist;
        
}
%enddef

TYPE_LONG_MACRO( SE_INSTANCE_LOCK );
TYPE_LONG_MACRO( SE_OBJECTLOCKINFO );
TYPE_LONG_MACRO( SE_INSTANCE_STATE_LOCK );



%typemap(in,numinputs=0) (CHAR ***keyword_list, LONG *keyword_count ) ( CHAR **tmp_keyword_list, LONG tmp_keyword_count) {
  // %typemap(python,in,numinputs=0) (CHAR **keyword_list, LONG* keyword_count) 
  // 
 
  $1 = &tmp_keyword_list;
  $2 = &tmp_keyword_count;
}

%typemap(argout) (  CHAR ***keyword_list, LONG *keyword_count) {
    int p_len,j;
    char** p_p_temp;
    $result = PyList_New(0);
    p_p_temp=$1[0];
    p_len = (int)*$2;
    for (j=0; j<p_len;j++){
        PyList_Append($result,PyString_FromString(p_p_temp[j]));
    }
    free(p_p_temp);
    SE_connection_free_keyword_info (p_len, *$1);
}

%typemap(memberin) CHAR **columns {
  // member in typemake
  $1=$input; 
}

%typemap(in) (const CHAR **columns, short num_columns) {
/*%typemap(in) (const CHAR **columns, short num_columns)*/
  if (PyList_Check($input)) {
    int size = PyList_Size($input);
    int i = 0;
    $2 = size;
    char *temp;
    $1 = (CHAR**) malloc((size+1)*sizeof($*1_type));
    for (i = 0; i < size; i++) {
      PyObject *o = PyList_GetItem($input,i);
      if (PyString_Check(o)){
        temp = PyString_AsString(PyList_GetItem($input,i));
        $1[i]=(CHAR*) malloc((strlen(temp)));
        strcpy($1[i],temp);
        }
      else {
        PyErr_SetString(PyExc_TypeError,"list must contain strings");
        //free($1);
        return NULL;
        }
    }
    $1[i] = 0;
    } 
  else {
    PyErr_SetString(PyExc_TypeError,"not a list");
    return NULL;
  }
}

%typemap(in) ( char **tables) {
/* %typemap(in) ( char **tables) { */
  if (PyList_Size($input)==0)
  {
    $1 = NULL;
  }
  else if (PyList_Check($input)) {
    int size = PyList_Size($input);
    int i = 0;
    char *temp;
    $1 = (CHAR**) malloc((size+1)*sizeof($*1_type));
    for (i = 0; i < size; i++) {
      PyObject *o = PyList_GetItem($input,i);
      if (PyString_Check(o)){
        temp = PyString_AsString(PyList_GetItem($input,i));
        $1[i]=(CHAR*) malloc((strlen(temp)));
        strcpy($1[i],temp);
        }
      else {
        PyErr_SetString(PyExc_TypeError,"list must contain strings");
        //free($1);
        return NULL;
        }
    }
    $1[i] = 0;
    } 
  else {
    PyErr_SetString(PyExc_TypeError,"not a list");
    return NULL;
  }
}
%typemap(out) char **tables {
  int len,i;
  len = 0;
  while ($1[len]) len++;
  $result = PyList_New(len);
  for (i = 0; i < len; i++) {
    PyList_SetItem($result,i,PyString_FromString($1[i]));
  }
}

%typemap(out) char ** {
/* typemap char ** */
  int len,i;
  len = 0;
  while ($1[len]) len++;
  $result = PyList_New(len-1);
  for (i = 0; i < len-1; i++) {
    PyList_SetItem($result,i,PyString_FromString($1[i]));
  }
}





#endif


