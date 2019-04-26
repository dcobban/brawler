include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )

message(STATUS "Fetching FreeType...")
FetchContent_Declare(
	freetype
	GIT_REPOSITORY https://git.sv.nongnu.org/r/freetype/freetype2.git
    GIT_TAG        "VER-2-8"
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/freetype
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/freetype
)

FetchContent_GetProperties( freetype )
if(NOT freetype_POPULATED)
	FetchContent_Populate( freetype )
	add_subdirectory( ${freetype_SOURCE_DIR} ${freetype_BINARY_DIR} )
	set_target_properties( freetype PROPERTIES
							SHARED OFF 
							STATIC ON )
endif()

set( FREETYPE_INCLUDE_DIR "${freetype_SOURCE_DIR}/include" )
set( FREETYPE_INCLUDE_DIRS "${freetype_SOURCE_DIR}/include" )
if(WIN32)
	set( FREETYPE_LIBRARY_RELEASE ${CMAKE_BINARY_DIR}/lib/freetype.lib )
	set( FREETYPE_LIBRARY_DEBUG ${CMAKE_BINARY_DIR}/lib/freetyped.lib )
else()
	set( FREETYPE_LIBRARY_RELEASE ${CMAKE_BINARY_DIR}/lib/freetype.so )
	set( FREETYPE_LIBRARY_DEBUG ${CMAKE_BINARY_DIR}/lib/freetyped.so )
endif()
set( FREETYPE_LIBRARIES optimized "${FREETYPE_LIBRARY_RELEASE}" debug "${FREETYPE_LIBRARY_DEBUG}" )

