include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )

option( TBB_BUILD_TESTS OFF )

set( TBB_INSTALL_RUNTIME_DIR "${CMAKE_BINARY_DIR}/bin" )
set( TBB_INSTALL_LIBRARY_DIR "${CMAKE_BINARY_DIR}/lib" )
set( TBB_INSTALL_ARCHIVE_DIR "${CMAKE_BINARY_DIR}/lib" )
set( TBB_INSTALL_INCLUDE_DIR "${CMAKE_BINARY_DIR}/include" )

message(STATUS "Fetching TBB...")
FetchContent_Declare(
	tbb
	GIT_REPOSITORY "https://github.com/wjakob/tbb.git"
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/tbb
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/tbb
)
FetchContent_GetProperties(tbb)
if(NOT tbb_POPULATED)
	FetchContent_Populate(tbb)
	add_subdirectory( ${tbb_SOURCE_DIR} ${tbb_BINARY_DIR} )
	set_target_properties( tbb PROPERTIES DEBUG_POSTFIX "_debug" )
endif()

SET( TBB_INCLUDE_DIR "${tbb_SOURCE_DIR}/include" )
SET( TBB_INCLUDE_DIRS "${tbb_SOURCE_DIR}/include" )

if( WIN32 )
	set( TBB_LIBRARY_RELEASE ${CMAKE_BINARY_DIR}/lib/tbb.lib )
	set( TBB_LIBRARY_DEBUG ${CMAKE_BINARY_DIR}/lib/tbb_debug.lib )
else()
	set( TBB_LIBRARY_RELEASE ${CMAKE_BINARY_DIR}/lib/libtbb.so )
	set( TBB_LIBRARY_DEBUG ${CMAKE_BINARY_DIR}/lib/libtbb_debug.so )
endif()
set( TBB_LIBRARIES optimized "${TBB_LIBRARY_RELEASE}" debug "${TBB_LIBRARY_DEBUG}" )
