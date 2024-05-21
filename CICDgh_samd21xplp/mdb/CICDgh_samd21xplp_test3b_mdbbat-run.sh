#!/bin/bash
#- Description: simple bat-script to call mdb.bat script
#-   call from 
#-		CICDgh_samd21xplp\
#-			|-Dockerfile, Jenkinsfile, LICENSE, README.md physical_setup.jpg
#-			|-CICDgh_samd21xplp\
#-				|-firmware\
#-				|-mdb\
#-
#-	->call-syntax:
#-	(lnx/jenkins: CICDgh_samd21xplp/)> ./CICDgh_samd21xplp/mdb/CICDgh_samd21xplp_test2_mdbcs-run.sh
#-
#- v1.0: first version (SL, 6.4.2024)

#- VARIABLES
#-scrN=CICDgh_samd21xplp_test3b_mdbbat-run.sh
scrN=$(basename $0)
MDBBAT_CMD=mdb.sh
#- either provide absolute path  (->case1)
#-  OR start from correct where you have (->case2):
#-   CICDgh_samd21xplp\firmware\
#-   CICDgh_samd21xplp\mdb\
#- case1: absolute path
#-  @SET REPO_P=D:\mchp\Sessions\2022\220516_CICD-4-ESIwebex\FW\CICDgh_samd21xplp
#-  @SET MDBBAT_CMDF_P=%REPO_P%\CICDgh_samd21xplp\mdb
#- case2: relative path = start in correct path (=Jeninks-WK)
MDBBAT_CMDF_P=CICDgh_samd21xplp/mdb
MDBBAT_CMDF_N=CICDgh_samd21xplp_test3c_mdbbat-cmd.txt
MDBBAT_CMD_F=${MDBBAT_CMDF_P}/${MDBBAT_CMDF_N}


   ######- MAIN -######
echo "######${scrN}: ======================================================="
echo "######${scrN}: Starting ... from `pwd`"

#- now start mdb.bat call
#- cmdLine: <repo>\CICDgh_samd21xplp\> mdb.sh $MDBBAT_CMD_F
echo ""
echo "######: Starting mdb.bat call: ${MDBBAT_CMD} ${MDBBAT_CMD_F}"
${MDBBAT_CMD} ${MDBBAT_CMD_F}


echo ""
echo "######${scrN}: finished"
echo ""
