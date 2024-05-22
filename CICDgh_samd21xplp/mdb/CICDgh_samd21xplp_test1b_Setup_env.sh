#!/bin/bash
#- Description: simple bat-script to setup the environment for M24_24014DEV4.
#-			  It basically extends the OS-search with the needed tools
#-
#- History:
#-   v1.1: working version-1 (SL, 6.4.2024)
#-   v1.0: first version (SL, 21.3.2024)
#-
#- Hints:
#-	user-Variables: to be adjusted for user-environment. 
#-	Important notice: DOS-shell does NOT allow spaces/tab
#-        around the '=' when defining env-variables !!!
export MPLABX_V=v6.20
export JAVA_VERS=zulu8.64.0.19-ca-fx-jre8.0.345-linux_x64
export XC32_V=v4.40
export MCHP_ROOT_HOME=/opt/microchip
export MPLABX_HOME=${MCHP_ROOT_HOME}/mplabx/${MPLABX_V}
export XC32_HOME=${MCHP_ROOT_HOME}/xc32/${XC32_V}
#- don't need GNU-tools, as we're on Linux, hurry
export GNU_HOME=${MPLABX_HOME}/gnuBins/GnuWin32

#-fix Variable
scrN=$(basename $0)



echo "###--------------------------------------------------------"
echo "###${scrN}: Starting ..."

#-  Copy current OS-searchpath PATH into BASEPATH, so
#-	below path-extending doesn't overflow doing it multiple times
#-  So if env-variable BASEPATH not set, then this script runs 1.time,
#-	hence BASEPATH=%PATH%, otherwise it ran before and BASEPATH already set.
#-  To keep it simple this must be done manually by user
if [[ -z "${BASEPATHSETDONE}" ]]; then
  echo   "###${scrN}: store current PATH in BASEPATH"
  export BASEPATH=${PATH}
  export BASEPATHSETDONE=1
else
  echo   "###${scrN}: BASEPATH set -> nothing to do" 
fi

#- extend OS-search
echo   "###${scrN}: extending OS-searchpath"
 #- don't need GNU-tools, as we're on Linux, hurry
#echo "SL1: $PATH"
export PATH="${MPLABX_HOME}/mplab_platform/bin:${XC32_HOME}/bin:${BASEPATH}"
#echo "SL2: $PATH"
which prjMakefilesGenerator.sh
which mdb.sh
which xc32-gcc
which make

echo   "###${scrN}: end"
echo   ""
