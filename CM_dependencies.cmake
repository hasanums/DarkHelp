# DarkHelp - C++ helper class for Darknet's C API.
# Copyright 2019-2020 Stephane Charette <stephanecharette@gmail.com>
# MIT license applies.  See "license.txt" for details.
# $Id$


FIND_PACKAGE ( Threads			REQUIRED	)
FIND_PACKAGE ( Darknet	CONFIG	REQUIRED	)
FIND_PACKAGE ( OpenCV	CONFIG	REQUIRED	)

SET ( StdCppFS "" )

IF (NOT WIN32)
	FIND_LIBRARY ( Magic magic ) # sudo apt-get install libmagic-dev

	# On older 18.04, we need to use "experimental/filesystem" instead of "filesystem",
	# and we need to pass in the -lstdc++fs flag when linking
	FIND_PATH ( FILESYSTEM "filesystem" )
	IF ( FILESYSTEM STREQUAL "FILESYSTEM-NOTFOUND" )
		SET ( StdCppFS stdc++fs	)
	ENDIF ()
ENDIF ()

FIND_PATH ( TCLAP_INCLUDE_DIRS "tclap/Arg.h" )

INCLUDE_DIRECTORIES ( ${Darknet_INCLUDE_DIR}	)
INCLUDE_DIRECTORIES ( ${OpenCV_INCLUDE_DIRS}	)
INCLUDE_DIRECTORIES ( ${TCLAP_INCLUDE_DIRS}		)
