include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED on )

# pbr_viewer
FetchContent_Declare(
	pbrviewer
	GIT_REPOSITORY https://github.com/pumexx/pbr_viewer.git
	#GIT_TAG        v0.2.0
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/../pbrviewer
)
FetchContent_GetProperties(pbrviewer)
if(NOT pbrviewer_POPULATED)
	FetchContent_Populate(pbrviewer)
	add_subdirectory( ${pbrviewer_SOURCE_DIR} ${pbrviewer_BINARY_DIR} )
endif()
