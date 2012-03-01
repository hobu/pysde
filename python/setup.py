try:
    from setuptools import setup, Extension
except ImportError:
    from distutils import setup, Extension
import os
import sys

sde_version=91

sde_libraries = [i%sde_version for i in ["sde%s", "sg%s","pe%s"]]

sde_extension = Extension("_sde", ["sde_wrap.cpp",],
                             libraries=sde_libraries,                      
                             )

sdeconstants_extension = Extension("_sdeconstants", ["sdeconstants_wrap.cpp",],
                             libraries=sde_libraries,                     
                             )
                           
setup(name          = 'PySDE',
      version       = '0.9.0',
      description   = 'PySDE - Python wrappers for the SDE C API',
      license       = 'BSD',
      keywords      = 'gis esri arcsde',
      author        = 'Howard Butler',
      author_email  = 'hobu@hobu.net',
      url           = 'http://github.com/hobu/pysde',
#      namespace_packages    = ['cartography'],
#      packages              = ['cartography.spatial',],
      ext_modules           = [sde_extension, sdeconstants_extension],
#      test_suite            = 'tests.runalltests.test_suite'
)