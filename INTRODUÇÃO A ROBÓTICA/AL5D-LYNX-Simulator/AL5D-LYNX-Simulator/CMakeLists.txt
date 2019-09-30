cmake_minimum_required(VERSION 2.6)
project(demo)

INCLUDE(FindPkgConfig)

IF(CMAKE_COMPILER_IS_GNUCC)
SET(CMAKE_CXX_FLAGS
"${CMAKE_CXX_FLAGS} -Wall -std=c++0x -DBUILD_SHARED_LIBS=OFF")
ENDIF(CMAKE_COMPILER_IS_GNUCC)

add_definitions(-DNON_MATLAB_PARSING)
add_definitions(-DMAX_EXT_API_CONNECTIONS=255)

set(SOURCES
    include/extApi.c
    include/extApiPlatform.c
)

set(LIB 
    libarmc_simulator.so
)
 
set(HEADERS
    include/extApi.h
    include/extApiInternal.h
    include/extApiPlatform.h
    include/v_repConst.h
    include/v_repLib.h
    include/armc_simulator.h
)

include_directories("include/")
include_directories("lib/")

find_package (Threads)

find_library(ARMC NAMES ${LIB} PATHS ${CMAKE_HOME_DIRECTORY}/lib/)

add_executable(demo
               demo.c
               ${SOURCES}
	       ${HEADERS})
	       
target_link_libraries(demo ${CMAKE_THREAD_LIBS_INIT} ${ARMC})


install(TARGETS demo RUNTIME DESTINATION bin)
