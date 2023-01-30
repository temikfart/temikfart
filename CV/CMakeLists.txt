PROJECT(LatexProject NONE)
CMAKE_MINIMUM_REQUIRED(VERSION 3.11)

# Find LaTex tools.
FIND_PACKAGE(LATEX)
IF(NOT LATEX_FOUND)
	MESSAGE(FATAL_ERROR "No latex tools found!")
ENDIF()

# Latex source file.
IF(NOT MAIN_TEX_BASE_FILENAME)
	MESSAGE(WARNING "The Tex file is not specified. Will use a default name: main.tex")
	SET(MAIN_TEX_BASE_FILENAME "main")
ENDIF()
SET(MAIN_TEX "${CMAKE_SOURCE_DIR}/${MAIN_TEX_BASE_FILENAME}.tex")

# The directory where the final build data will be stored.
FILE(MAKE_DIRECTORY ${LATEX_OUTPUT_PATH})
SET(OUT_DIRECTORY "${CMAKE_SOURCE_DIR}/${LATEX_OUTPUT_PATH}")

# Directory where the source files are located.
SET(WORKINGDIR "${CMAKE_SOURCE_DIR}")

IF(WITH_BIBLIOGRAPHY)
	# The name of .bcf file.
	SET(MAIN_BCF_FILE "${MAIN_TEX_BASE_FILENAME}.bcf")

	# First pass.
	ADD_CUSTOM_TARGET(latex-prebuild
		COMMAND ${PDFLATEX_COMPILER} -output-directory=${OUT_DIRECTORY} ${MAIN_TEX}
		COMMENT "Starting Prebuild."
		WORKING_DIRECTORY ${WORKINGDIR}
		DEPENDS ${MAIN_TEX})

	# Generate what citation found in the latex file.
	ADD_CUSTOM_TARGET(latex-bibreferences
		COMMAND ${BIBER_COMPILER} --input-directory=${OUT_DIRECTORY} --output-directory=${OUT_DIRECTORY} ${MAIN_BCF_FILE}
		COMMENT "Read and create main bib references file."
		DEPENDS  "${OUT_DIRECTORY}/${MAIN_BCF_FILE}")
	ADD_DEPENDENCIES(latex-bibreferences latex-prebuild)
ENDIF()

# Generate the final pdf.
ADD_CUSTOM_TARGET(latex-pdf
	COMMAND ${PDFLATEX_COMPILER} -output-directory=${OUT_DIRECTORY} ${MAIN_TEX}
	COMMENT "Assembling the final pdf file."
	WORKING_DIRECTORY ${WORKINGDIR}
	DEPENDS  ${MAIN_TEX})

IF(WITH_BIBLIOGRAPHY)
	ADD_DEPENDENCIES(latex-pdf latex-prebuild latex-bibreferences)
ENDIF()

ADD_CUSTOM_TARGET(all-formats ALL) # Entry point of execution.
ADD_DEPENDENCIES(all-formats latex-pdf)

# Remove files after compilation.
# MESSAGE(STATUS "HERE")
# SET(FINAL_PDF_FILE "${MAIN_TEX_BASE_FILENAME}.pdf")
# FILE(COPY "${OUT_DIRECTORY}/${FINAL_PDF_FILE}" DESTINATION "${CMAKE_SOURCE_DIR}")
# FILE(REMOVE_RECURSE "${OUT_DIRECTORY}")
