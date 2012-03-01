/*
SWIG interface for ArcSDE

Copyright (c) 2005 Iowa State University
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the
Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall
be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/


%include "exception.i"
%import "std_string.i"

%module sde
%feature("autodoc");
//%import "sdetype.h"

%{
#include "sdetype.h"
#include "sdeerno.h"
#include "sderaster.h"
#include "pe.h"
#include "pedef.h"
#include "sgerr.h"
#include "sg.h"

typedef void Connection;
typedef void Stream;
typedef void Shape;
typedef void Coordref;
typedef void CoordSys;
typedef void Envelope;
typedef void QueryInfo;


 void throw_if_error(long error_code) 
    {
      if( error_code != 0 ) 
      {
        char* cerror;
        cerror = (char*) malloc(SE_MAX_MESSAGE_LENGTH);
        std::string error_string;
        SE_error_get_string (error_code, cerror);
        error_string = std::string(cerror);
        free(cerror);
        throw error_string;
      }  
    };

 

  
%}

#ifdef SWIGPYTHON
%include "typemaps_python.i"
#endif


%include "structs.i"
%include "Connection.i"
%include "Stream.i"
%include "Coordref.i"
%include "QueryInfo.i"

//%include "helpers.i"
