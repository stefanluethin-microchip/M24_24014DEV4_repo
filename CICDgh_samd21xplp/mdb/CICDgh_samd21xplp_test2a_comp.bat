@REM
@REM description: simple dos-script to compile CICDgh_samd21xplp FW
@REM
@REM version:
@REM  MPLABX-v6.20, XC32-v4.35, MCC-v5.5.1
@REM
@REM usage:
@REM  1) get repository with
@REM     ()> git clone https://github.com/stefanluethin-microchip/M24_24014DEV4_repo
@REM     ()> cd M24_24014DEV4_repo
@REM     
@REM  2) open dos-shell and set OS-path:
@REM    (M24_24014DEV4_repo\)>  .\CICDgh_samd21xplp\mdb\CICDgh_samd21xplp_test1a_Setup_env.bat
@REM 
@REM  2) compile CICDgh_samd21xplp FW
@REM    (M24_24014DEV4_repo\)>  .\CICDgh_samd21xplp\mdb\CICDgh_samd21xplp_test1b_comp.bat
@REM
@REM History:
@REM   v1.1: version for M24-class 24014DEV4 repo (SL, 15.5.2024)
@REM   v1.0: first working version (SL, 03.1.23)
@REM

@REM   VARIABLES
@SET scrN=CICDgh_samd21xplp_test1b_comp.bat


@REM  ######-------MAIN-----#################

@REM  ###-------env-checking...
@REM  #-check OS-path set by checking BASEPATH -> 'dev11mod4Lab_mdbcs-1Setup_env.bat'
@IF "%BASEPATH%"=="" (
    @ECHO    ###: for simplicity you must copy the current OS-searchpath into BASEPATH with:
    @ECHO    ###:        set BASEPATH=^%%PATH%%
    @ECHO    ###: and run 'CICDgh_samd21xplp\mdb\CICDgh_samd21xplp_test1a_Setup_env.bat' and re-run
    GOTO SCR_ERROR
) ELSE (
    @ECHO    ##: BASEPATH set -^> continue
)


@REM check xc32-gcc is in searchpath
@SET XC32_CALL=xc32-gcc
@CALL WHERE /q %XC32_CALL% || ECHO XXXXXXXXXXXX: xc32-gcc not found && GOTO SCR_ERROR
@ECHO %XC32_CALL% found in OS-path
@ECHO _


@REM  ###-------create/update Makefiles
@ECHO _
@ECHO ######(%scrN%): Creating makefiles
@CALL WHERE prjMakefilesGenerator.bat
@CALL PUSHD .
@CALL CD .\CICDgh_samd21xplp\firmware
@CALL LS -F .
@CALL LS -la .\CICDgit_samd21xplp.X\nbproject
@CALL prjMakefilesGenerator.bat .\CICDgit_samd21xplp.X
@CALL LS -la .\CICDgit_samd21xplp.X\nbproject

@REM  ###-------compile using 'make'...
@ECHO _
@ECHO ######(%scrN%): compiling ...
@CALL WHERE %XC32_CALL%
@CALL WHERE make
@CALL LS -la .\CICDgit_samd21xplp.X\
@CALL CD .\CICDgit_samd21xplp.X  &&  make
@CALL LS -la .\CICDgit_samd21xplp.X\dist\samd21xplp\production
@CALL POPD
@ECHO _

@ECHO ######(%scrN%): final elf .\CICDgit_samd21xplp\firmware\CICDgit_samd21xplp.X\dist\samd21xplp\production\CICDgit_samd21xplp.X.production.elf

@ECHO _
@ECHO ======(%scrN%): SUCCESS
@ECHO _

@GOTO END

:SCR_ERROR
  @ECHO _
  @ECHO XXXXXXXXXXXX(%scrN%): some error occured
  
:END
  @ECHO %scrN%: END
