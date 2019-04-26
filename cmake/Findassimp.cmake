include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )

option(ASSIMP_BUILD_TESTS OFF)
option(ASSIMP_BUILD_ASSIMP_TOOLS OFF)

message(STATUS "Fetching AssImp...")
FetchContent_Declare(
	assimp
	GIT_REPOSITORY https://github.com/assimp/assimp.git
    GIT_TAG        "v4.1.0"
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/assimp
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/assimp
)

FetchContent_GetProperties(assimp)
if(NOT assimp_POPULATED)
	FetchContent_Populate(assimp)

	set(ZLIB_LIBRARIES zlibstatic)
	set(ENABLE_BOOST_WORKAROUND ON)
	set(BUILD_ASSIMP_TOOLS  ON)
	set(ASSIMP_BUILD_STATIC_LIB ON)

	add_subdirectory( ${assimp_SOURCE_DIR} ${assimp_BINARY_DIR} )
	set_target_properties(	assimp PROPERTIES
							SHARED OFF 
							STATIC ON 
							DEBUG_POSTFIX "d")
	
endif()

set( ASSIMP_INCLUDE_DIR "${assimp_SOURCE_DIR}/include;${assimp_BINARY_DIR}/include" )
set( ASSIMP_INCLUDE_DIRS "${ASSIMP_INCLUDE_DIR}" )
if( MSVC12 )
	set( ASSIMP_MSVC_VERSION "vc120" )
else()	
	set( ASSIMP_MSVC_VERSION "vc140" )
endif()
if( MSVC12 OR MSVC14 )
	set( ASSIMP_LIBRARY_RELEASE "${CMAKE_BINARY_DIR}/lib/assimp-${ASSIMP_MSVC_VERSION}-mt.lib" )
	set( ASSIMP_LIBRARY_DEBUG "${CMAKE_BINARY_DIR}/lib/assimp-${ASSIMP_MSVC_VERSION}-mtd.lib" )
	set( ASSIMP_LIBRARIES optimized "${ASSIMP_LIBRARY_RELEASE}" debug "${ASSIMP_LIBRARY_DEBUG}" )
endif() 

