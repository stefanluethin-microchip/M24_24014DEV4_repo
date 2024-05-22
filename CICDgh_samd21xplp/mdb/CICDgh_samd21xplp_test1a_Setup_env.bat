::@ECHO off
@REM Description: simple bat-script to setup the environment for M24_24014DEV4.
@REM			  It basically extends the OS-search with the needed tools
@REM
@REM History:
@REM   v1.0: first version (SL, 21.3.2024)
@REM
@REM Hints:
@REM	user-Variables: to be adjusted for user-environment. 
@REM	Important notice: DOS-shell does NOT allow spaces/tab
@REM        around the '=' when defining env-variables !!!
@SET MPLABX_V=v6.20
@SET JAVA_VERS=zulu8.64.0.19-ca-fx-jre8.0.345-win_x64
@SET XC32_V=v4.40
@SET MPLABX_HOME=C:\Program Files\Microchip\MPLABX\%MPLABX_V%
@SET GNU_HOME=%MPLABX_HOME%\gnuBins\GnuWin32
@SET XC32_HOME=C:\Program Files\Microchip\xc32\%XC32_V%

@REM fix Variable
@SET scrN=CICDgh_samd21xplp_test1a_Setup_env.bat


@ECHO ###-------------------------------------------------------- 
@ECHO ###--- %scrN% Starting ...

@REM  Copy current OS-searchpath PATH into BASEPATH, so
@REM	below path-extending doesn't overflow doing it multiple times
@REM  So if env-variable BASEPATH not set, then this script runs 1.time,
@REM	hence BASEPATH=%PATH%, otherwise it ran before and BASEPATH already set.
@REM  To keep it simple this must be done manually by user
@IF NOT DEFINED BASEPATHSETDONE ( 
	@ECHO   ##: store current PATH in BASEPATH
	@SET "BASEPATH=%PATH%"
	@SET BASEPATHSETDONE=1
) ELSE (
	@ECHO    ##: BASEPATH set -^> nothing to do
)

@REM extend OS-search
@ECHO    ##: extending OS-searchpath
@SET PATH=%XC32_HOME%\bin;%MPLABX_HOME%\mplab_platform\bin;%GNU_HOME%\bin;%BASEPATH%

@ECHO %scrN%: END



