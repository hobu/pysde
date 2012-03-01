#ifdef SWIGPYTHON
%include "typemaps_python.i"
#endif

typedef struct {
    long sde_error;                          /* SDE error code */
    long ext_error;                          /* DBMS or OS errno code */
    char err_msg1[SE_MAX_MESSAGE_LENGTH];    /* DBMS or SE_error_get_string
                                                msg */
    char err_msg2[SE_MAX_SQL_MESSAGE_LENGTH];/* Second DBMS error, if
                                                applicable */
} SE_ERROR;

typedef struct {
    long        pid;    
    short       layer_id;
    long        lock_type;
} SE_INSTANCE_LOCK;


/************************************************************
*** SDE STREAM SPECIFICATION
************************************************************/
typedef struct {
    long  min_size;            /* minimum size of buffer */
    long  max_size;            /* total size of buffer */
    long  min_objects;         /* minimum number of objects to put in buffer */
    long  max_array_size;      /* maximum number of elements per array */
    long  attribute_bytes;     /* attribute array buffer size */
    long  shape_point_bytes;   /* shape geometry array buffer size */
    long  blob_bytes;          /* obsolete as of ArcSDE 8.0.2 */
    long  max_bytes_per_blob;  /* obsolete as of ArcSDE 8.0.2 */
    long  stream_pool_size;    /* minimum # of streams to keep in the pool */
    long  raster_buf_size;     /* raster buffer size */
} SE_STREAM_SPEC;

/************************************************************
*** SDE RELEASE/VERSION STRUCTURE
************************************************************/
typedef struct
{
    long    major;             /* Major release    */
    long    minor;             /* Minor release    */
    long    bug;               /* Bug version      */
    char    desc[96];          /* Description      */
    long    release;           /* Release Number   */
    long    rel_low_supported; /* Lowest Release supported */
}   SE_RELEASE;

/************************************************************
*** SDE INSTANCE STRUCTURES
************************************************************/
typedef struct {
  SE_RELEASE   version;     /* Release version of specified instance.       */
  long         connections; /* Number of current connections to SDE on node.*/
  long         system_mode; /* Accepting connections or blocking.           */
} SE_INSTANCE_STATUS;

/************************************************************
*** SDE COLUMN DEFINITION STRUCTURE "SE_COLUMN_DEF"
************************************************************/
typedef struct {
    char  column_name[SE_MAX_COLUMN_LEN]; /* the column name */
    long  sde_type;                       /* the SDE data type */
    long  size;                           /* the size of the column values */
    short decimal_digits;                 /* number of digits after decimal */
    int  nulls_allowed;                  /* allow NULL values ? */
    short row_id_type;                    /* column's use as table's row id */
} SE_COLUMN_DEF;

/************************************************************
*** SDE BLOB ATTRIBUTE STRUCTURE "SE_BLOB_INFO"
************************************************************/
typedef struct {
    long        blob_length;            /* LENGTH IN BYTES OF BLOB */
    char        *blob_buffer;           /* LINEAR BUFFER OF BLOB DATA */
} SE_BLOB_INFO;

typedef struct {
    long       num_tables;    /* number of tables */
    char       **tables;      /* table names */
    char       *where;        /* where clause */
} SE_SQL_CONSTRUCT;

typedef struct
{
    double minx;
    double miny;
    double maxx;
    double maxy;
} SE_ENVELOPE;