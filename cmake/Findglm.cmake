include( FetchContent )
set( FETCHCONTENT_UPDATES_DISCONNECTED ON )

cmake_policy(SET CMP0048 NEW)

message(STATUS "Fetching GLM...")
FetchContent_Declare(
	glm
	GIT_REPOSITORY https://github.com/g-truc/glm.git
    GIT_TAG        "0.9.8"
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/glm
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/glm
)

FetchContent_GetProperties(glm)
if(NOT glm_POPULATED)
	FetchContent_Populate(glm)
	add_subdirectory( ${glm_SOURCE_DIR} ${glm_BINARY_DIR} )
endif()

set (GLM_INCLUDE_DIR "${glm_SOURCE_DIR}" )
set (GLM_INCLUDE_DIRS "${glm_SOURCE_DIR}" )
set (GLM_LIBRARY "" )
set (GLM_LIBRARIES "" )
