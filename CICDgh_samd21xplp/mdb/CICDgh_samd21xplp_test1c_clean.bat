@REM
@REM description: simple dos-script to clean M24_24014DEV4 FW-prj
@REM
@REM History:
@REM   v1.0: first working version (SL, 20.3.24)


@echo currently here1: %cd%

@REM @echo #########: delete mplab-trace files from start-directory
@CALL PUSHD .
@CALL CD .\CICDgh_samd21xplp\firmware\CICDgit_samd21xplp.X
@REM @echo currently here2: %cd%
@REM @echo #########: ls Makefile-*
@REM @CALL LS -F  Makefile-*
@REM @echo #########: ls private\
@REM @CALL LS -F  private
@CALL RM -rf nbproject\Makefile-*
@CALL RM -rf nbproject\private
@CALL RM -rf .generated_files\
@CALL RM -rf build
@CALL RM -rf debug
@CALL RM -rf dist
@REM @CALL RM -rf defmplabxtrace*

@CALL POPD
@echo currently here3: %cd%
