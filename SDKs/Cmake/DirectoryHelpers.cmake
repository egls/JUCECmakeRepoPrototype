cmake_minimum_required(VERSION 3.15)

MACRO(SUBDIRLIST result curdir)
    FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
    SET(dirlist "")
    FOREACH(child ${children})
        IF(IS_DIRECTORY ${curdir}/${child})
            LIST(APPEND dirlist ${child})
        ENDIF()
    ENDFOREACH()
    SET(${result} ${dirlist})
ENDMACRO()

function (add_projects_from TargetDir)
    SUBDIRLIST(SUBDIRS ${TargetDir})
    FOREACH(subdir ${SUBDIRS})
        add_subdirectory(${subdir})
    ENDFOREACH()
endfunction()
