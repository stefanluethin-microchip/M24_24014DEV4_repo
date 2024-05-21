@REM Description: simple bat-script to call mdb.bat script
@REM 
@REM    -> call from Jenkins-prj-directory that includes Jenkinsfile, Dockerfile, MPLABX-Prj,...:
@REM      'CICDgh_samd21xplp\
@REM              |-Dockerfile, Jenkinsfile, LICENSE, README.md physical_setup.jpg
@REM              |-CICDgh_samd21xplp\
@REM                  |-firmware\
@REM                  |-mdb\
@REM    ->call-syntax:
@REM    (DOS: CICDgh_samd21xplp\)> .\CICDgh_samd21xplp\mdb\CICDgh_samd21xplp_test3a_mdbbat-run.bat
@REM
@REM Assumptions:
@REM    -) start in Jenkins-prj-directory that includes Jenkinsfile, Dockerfile, MPLABX-Prj,...:
@REM    -) mdb.bat path in your OS-search-path -> check with '(DOS)> where mdb.bat'
@REM
@REM History:
@REM   v1.1: version for M24-class 24014DEV4 (SL, 15.5.24)
@REM   v1.0: first working version (SL, 27.6.22)

@REM   VARIABLES
@SET scrN=CICDgh_samd21xplp_test3a_mdbbat-run.bat
@SET MDBBAT_CMD=mdb.bat
::REM either provide absolute path  (->case1)
::REM  OR start from correct where you have (->case2):
::REM   CICDgh_samd21xplp\firmware\
::REM   CICDgh_samd21xplp\mdb\
::REM case1: absolute path
::@SET REPO_P=D:\mchp\Sessions\2022\220516_CICD-4-ESIwebex\FW\CICDgh_samd21xplp
::@SET MDBBAT_CMDF_P=%REPO_P%\CICDgh_samd21xplp\mdb
::REM case2: relative path = start in correct path (=Jeninks-WK)
@SET MDBBAT_CMDF_P=CICDgh_samd21xplp\mdb
@SET MDBBAT_CMDF_N=CICDgh_samd21xplp_test3c_mdbbat-cmd.txt

@SET MDBBAT_CMD_F=%MDBBAT_CMDF_P%\%MDBBAT_CMDF_N%


@REM   ######- MAIN -######
@ECHO ######: =======================================================
@ECHO ######(%scrN%): Starting ...

@REM capture starting dir-path, so we can go back
@SET ORIG_P=%cd%
::@CD %REPO_P%
@ECHO ######: Starting %scrN% from %cd%
@ECHO _

@REM now start mdb.bat call
@REM cmdLine: <repo>\CICDgh_samd21xplp\> mdb.bat %MDBBAT_CMD_F%
@ECHO _
@ECHO ######: Starting mdb.bat call: -%MDBBAT_CMD% "%MDBBAT_CMD_F%"-
@CALL %MDBBAT_CMD% "%MDBBAT_CMD_F%"


@REM go back to where script started
@ECHO _
@ECHO ======(%scrN%): SUCCESS
