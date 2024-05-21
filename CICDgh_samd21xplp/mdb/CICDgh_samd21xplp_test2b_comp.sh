#!/bin/bash

#-description: compile script like 'CICDgh_samd21xplp_test1b_comp.bat' (=Windows)
#- 				but for Linux.
#-history:
#-  v1.1: version for M24-class 24014DEV4 repo (SL, 15.5.2024)
#-

export PRJ_ROOT_P=CICDgh_samd21xplp/firmware
export PRJ_P=${PRJ_ROOT_P}/CICDgit_samd21xplp.X
export ELF_P=${PRJ_P}/dist/samd21xplp/production
#scrN="CICDgh_samd21xplp/mdb/CICDgh_samd21xplp_test1b_comp.sh"
scrN=$(basename $0)

###-------create/update Makefiles
echo "######${scrN}: Creating makefiles from `pwd`"
which prjMakefilesGenerator.sh ${PRJ_P}
echo ""
echo "ls -la ${PRJ_P}/nbproject"
ls -la ${PRJ_P}/nbproject
prjMakefilesGenerator.sh ${PRJ_P}
echo "ls -la ${PRJ_P}/nbproject"
ls -la ${PRJ_P}/nbproject

###-------compile using 'make'...
echo ""
echo "#####(${scrN}): compiling ... (from `pwd`)"
ls ${PRJ_P}
pushd .
cd ${PRJ_P}  &&  make
popd
ls ${ELF_P}

echo ""
echo "#######################################################"
echo "######${scrN}: final elf is here:"
ls ${ELF_P}/*.elf
echo ""

echo ""
echo "#####(${scrN}): finished in `pwd`"

#eof
