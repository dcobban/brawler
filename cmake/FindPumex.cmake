cmake_policy(SET CMP0076 NEW)

# Pumex
FetchContent_Declare(
	pumex
	GIT_REPOSITORY https://github.com/pumexx/pumex.git
	GIT_TAG        v0.2.0
	SOURCE_DIR     ${CMAKE_SOURCE_DIR}/external/pumex
	BINARY_DIR     ${CMAKE_BINARY_DIR}/external/pumex
	INSTALL_DIR    ${CMAKE_SOURCE_DIR}/bin
)
FetchContent_GetProperties(pumex)
if(NOT pumex_POPULATED)
	FetchContent_Populate(pumex)
	add_subdirectory( ${pumex_SOURCE_DIR} ${pumex_BINARY_DIR} )
endif()
